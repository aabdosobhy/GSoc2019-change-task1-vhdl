library ieee;
use ieee.std_logic_1164.all;

entity ser2par is 
	generic ( 
		PARALLEL_SIZE : integer := 12				 -- output parallel word size 
	); 
	port (
		clk : in std_logic ;					     -- input clock 
		start : in std_logic;					     -- start signal 
		serial_bit : in std_logic;				     -- serial bit from the serial line 
		bit_slip : in std_logic;					     -- input bit_slip 
		word_size_select : in std_logic_vector (1 downto 0);	     -- adjusted output word size
		parallel_out : out std_logic_vector (PARALLEL_SIZE -1 downto 0) -- output parallel word
	);    

end entity ser2par;

architecture ser2par_A of ser2par is

	component Register_1b is
		port( 
			clk : in std_logic;		-- input clock 
			enb : in std_logic;		-- input enable write 
			rst : in std_logic;		-- input reset 
			d : in std_logic;		-- input data to register
			q : out std_logic		-- output data of the register 
		); 
	end component;

	component nRegister is
		generic (
			size : integer := 12
		);
		port( 
			clk : in std_logic;		-- input clock 
			enb : in std_logic;		-- input enable write 
			rst : in std_logic;		-- input reset 
			d : in std_logic_vector (size-1 downto 0);	-- input data to register
			q : out std_logic_vector (size-1 downto 0)	-- output data of the register 
		); 
	end component;

	component Shift_Register is
		generic (
		 	size : integer := 12
		);
		port( 
			clk : in std_logic;		-- input clock 
			rst : in std_logic;		-- input reset 
			d : in std_logic;		-- input shift data
			q : out std_logic_vector (size-1 downto 0)	-- output data of the register 
		); 
	end component;

	component counter_shift is
		generic (
		 	size : integer := 12
		);
		port( 
			clk : in std_logic;		-- input clock 
			rst : in std_logic;		-- input reset 
			q : out std_logic_vector (size-1 downto 0)	-- output data of the register 
		); 
	end component;

	signal bit_slip_save : std_logic;			-- register to save the bit_slip signal 
	signal word_size_save : std_logic_vector (1 downto 0);	-- register to save the parallel word size 
	signal repeat_counter : std_logic;			-- reset all the counters to 100...0 to repeat the shifting again for the new word
	signal data_ready : std_logic;				-- enable bit to save the word constructed in the finalData register 
	signal counter_8_bits  : std_logic_vector (3 downto 0);	-- shift register of 8-bits acts as a counter for the word-size 8 and no bit_slip 
	signal counter_9_bits  : std_logic_vector (4 downto 0);	-- shift register of 9-bits acts as a counter for the word-size 8 and bit_slip  
	signal counter_10_bits : std_logic_vector (5 downto 0);	-- shift register of 10-bits acts as a counter for the word-size 10 and no bit_slip 
	signal counter_11_bits : std_logic_vector (6 downto 0);-- shift register of 11-bits acts as a counter for the word-size 10 and bit_slip 
	signal counter_12_bits : std_logic_vector (7 downto 0);-- shift register of 12-bits acts as a counter for the word-size 12 and no bit_slip 
	signal counter_13_bits : std_logic_vector (8 downto 0);-- shift register of 13-bits acts as a counter for the word-size 12 and bit_slip 
	signal word_size_comb_i , word_size_comb_o : std_logic_vector (3 downto 0);
	signal word_size_comb_i2 , word_size_comb_o2 : std_logic_vector (1 downto 0);
	signal shift_bits : std_logic_vector (11 downto 0);	-- shift register of 12-bits that shifts the serial data every clk cycle 
	signal bit_3_out, bit_2_out, bit_1_out, bit_0_out : std_logic;	-- temp signals for masking the LSB of the parallel data 
	signal word_formation : std_logic_vector (11 downto 0);		-- combining the parallel data to be transmit in that signal 
	signal rep_count_i_p1 , rep_count_o_p1 : std_logic_vector (5 downto 0);
	signal rep_count_i_p2 , rep_count_o_p2 : std_logic_vector (5 downto 0);
	signal rep_count_i_p3 , rep_count_o_p3 : std_logic_vector (2 downto 0);
	signal rep_count_i_p4 , rep_count_o_p4 : std_logic_vector (1 downto 0);
	signal rep_count_i_p5 , rep_count_o_p5 : std_logic;


begin

	bit_slip_reg : Register_1b port map (clk, counter_8_bits(3), start,bit_slip, bit_slip_save);   
	 
	word_size : nRegister generic map (size => 2) port map (clk, counter_8_bits(3), '0', word_size_select, word_size_save);
	word_size_combination : nRegister generic map (size => 4) 
				port map (clk,counter_8_bits(2), '0', word_size_comb_i, word_size_comb_o);
	word_size_combination2 : nRegister generic map (size => 2) 
				port map (clk,counter_8_bits(1), '0', word_size_comb_i2 , word_size_comb_o2);


	counter8:  counter_shift generic map (size => 4)  port map (clk, repeat_counter, counter_8_bits);
	counter9:  counter_shift generic map (size => 5)  port map (clk, repeat_counter, counter_9_bits);
	counter10: counter_shift generic map (size => 6) port map (clk, repeat_counter, counter_10_bits);
	counter11: counter_shift generic map (size => 7) port map (clk, repeat_counter, counter_11_bits);
	counter12: counter_shift generic map (size => 8) port map (clk, repeat_counter, counter_12_bits);
	counter13: counter_shift generic map (size => 9) port map (clk, repeat_counter, counter_13_bits);

	Serial_shift: Shift_Register generic map (size => 12) port map (clk, start, serial_bit, shift_bits);

	repeat_count_pip1 : nRegister generic map (size => 6) port map (clk, '1', start, rep_count_i_p1, rep_count_o_p1);
	repeat_count_pip2 :nRegister generic map (size => 6) port map (clk, '1', start, rep_count_i_p2, rep_count_o_p2);
	repeat_count_pip3 :nRegister generic map (size => 3) port map (clk, '1', start, rep_count_i_p3 , rep_count_o_p3);
	repeat_count_pip4 :nRegister generic map (size => 2) port map (clk, '1', start, rep_count_i_p4 , rep_count_o_p4);
	repeat_count_pip5 :Register_1b port map (clk, '1', start, rep_count_i_p5 , rep_count_o_p5);

	data_readyR: Register_1b port map (clk , '1', start, repeat_counter, data_ready); 

	finalData :  nRegister generic map (size => 12) port map (clk, data_ready, start, word_formation, parallel_out);

	word_size_comb_i(3) <= word_size_save(0) or  word_size_save(1);		--word size = !"00"
	word_size_comb_i(2) <= not word_size_save(0) and not  word_size_save(1);--word size = "00"
	word_size_comb_i(1) <= word_size_save(0) and not word_size_save(1);	--word size = "01"
	word_size_comb_i(0) <= word_size_save(1);				--word size = "1x"
	word_size_comb_i2(1) <= word_size_comb_o(3);
	word_size_comb_i2(0) <= word_size_comb_o(0);
	rep_count_i_p1(5) <= word_size_comb_o(2) and not bit_slip_save;
	rep_count_i_p1(4) <= word_size_comb_o(2) and bit_slip_save;
	rep_count_i_p1(3) <= word_size_comb_o(1) and not bit_slip_save;
	rep_count_i_p1(2) <= word_size_comb_o(1) and bit_slip_save;
	rep_count_i_p1(1) <= word_size_comb_o(0) and not bit_slip_save;
	rep_count_i_p1(0) <= word_size_comb_o(0) and bit_slip_save;

	rep_count_i_p2(5) <= counter_8_bits(0)  and rep_count_o_p1(5);
	rep_count_i_p2(4) <= counter_9_bits(0)  and rep_count_o_p1(4);
	rep_count_i_p2(3) <= counter_10_bits(0) and rep_count_o_p1(3);
	rep_count_i_p2(2) <= counter_11_bits(0) and rep_count_o_p1(2);
	rep_count_i_p2(1) <= counter_12_bits(0) and rep_count_o_p1(1);
	rep_count_i_p2(0) <= counter_13_bits(0) and rep_count_o_p1(0);

	rep_count_i_p3(2) <= rep_count_o_p2(5) or rep_count_o_p2(4);
	rep_count_i_p3(1) <= rep_count_o_p2(3) or rep_count_o_p2(2);
	rep_count_i_p3(0) <= rep_count_o_p2(1) or rep_count_o_p2(0);

	rep_count_i_p4(1) <= rep_count_o_p3(2) or rep_count_o_p3(1);
	rep_count_i_p4(0) <= rep_count_o_p3(0);

	rep_count_i_p5 <= rep_count_o_p4(0) or rep_count_o_p4(1);

	repeat_counter <= rep_count_o_p5 or start;

	bit_3_out <= shift_bits(3) and word_size_comb_o2(1); 
	bit_2_out <= shift_bits(2) and word_size_comb_o2(1);
	bit_1_out <= shift_bits(1) and word_size_comb_o2(0);
	bit_0_out <= shift_bits(0) and word_size_comb_o2(0);

	word_formation <= shift_bits(11 downto 4) & bit_3_out & bit_2_out & bit_1_out & bit_0_out;

end ser2par_A;