library ieee;
use ieee.std_logic_1164.all;

entity ser2par is
	generic (
		PARALLEL_SIZE : integer := 12	-- output parallel word size
	); 
	port (
		clk : in std_logic;		-- clock
		start : in std_logic;	-- start signal
		serial_bit : in std_logic;	-- serial bit
		bit_slip : in std_logic;	-- bit slip
		word_size_select : in std_logic_vector(1 downto 0);	
			-- adjusted o/p word size
		parallel_out : out std_logic_vector(PARALLEL_SIZE -1 downto 0)
			-- parallel word
	);    

end entity ser2par;

architecture ser2par_A of ser2par is

	component Register_1b is
		port(
			clk : in std_logic;		-- clock
			enb : in std_logic;		-- enable write
			rst : in std_logic;		-- reset
			d : in std_logic;		-- data to register
			q : out std_logic		-- o/p data register
		);
	end component;

	component nRegister is
		generic(
			SIZE : integer := 12
		);
		port(
			clk : in std_logic;		-- clock
			enb : in std_logic;		-- enable write
			rst : in std_logic;		-- reset
			d : in std_logic_vector(SIZE -1 downto 0);	-- data to register
			q : out std_logic_vector(SIZE -1 downto 0)	-- o/p data register
		); 
	end component;

	component Shift_Register is
		generic(
		 	SIZE : integer := 12
		);
		port(
			clk : in std_logic;		-- clock 
			rst : in std_logic;		-- reset 
			word_formation : in std_logic_vector(1 downto 0); -- format 4-lSBs
			d : in std_logic;		-- shift data
			q : out std_logic_vector(SIZE -1 downto 0)	-- o/p data register 
		); 
	end component;

	component counter_shift is
		generic(
		 	SIZE : integer := 12
		);
		port( 
			clk : in std_logic;		-- clock 
			rst : in std_logic;		-- reset 
			repeat_count : in std_logic;
			q : out std_logic_vector(SIZE -1 downto 0)	-- o/p data register 
		); 
	end component;

	component  Register_1b_qq is
		port( 
			clk : in std_logic;		-- clock
			enb : in std_logic;		-- enable write
			rst : in std_logic;		-- reset
			d : in std_logic;		-- data to register
			q : out std_logic;		-- o/p data register
			q_not : out std_logic	-- o/p not data register
		); 
	end component;

	signal rep_c8 : std_logic;
	signal data_ready : std_logic;
	signal start_save, bit_slip_save, bit_slip_s_par : std_logic;			
	signal word_size_save : std_logic_vector(1 downto 0);
	signal shift_bits : std_logic_vector(11 downto 0);
	signal word_size_comb : std_logic_vector(1 downto 0);
	signal word_size_comb_i, word_size_comb_o : std_logic_vector(3 downto 0);
	signal counter_8_bits  : std_logic_vector(3 downto 0);
	signal counter_9_bits  : std_logic_vector(4 downto 0);
	signal counter_10_bits : std_logic_vector(5 downto 0);
	signal counter_11_bits : std_logic_vector(6 downto 0);
	signal counter_12_bits : std_logic_vector(7 downto 0);
	signal counter_13_bits : std_logic_vector(8 downto 0);
	signal data_ready_i_p1, data_ready_o_p1 : std_logic_vector(2 downto 0);
	signal data_ready_i_p2, data_ready_o_p2 : std_logic_vector(1 downto 0);
	signal data_ready_i_p3, data_ready_o_p3 : std_logic;
	signal rep_count_i_p1, rep_count_o_p1 : std_logic_vector(5 downto 0);
	signal rep_count_i_p2, rep_count_o_p2 : std_logic_vector(5 downto 0);

begin

	bit_slip_reg : Register_1b_qq 
		port map (
			clk => clk, 
			enb => '1',
			rst => start, 
			d => bit_slip, 
			q => bit_slip_save, 
			q_not => bit_slip_s_par );   

	word_size : nRegister 
		generic map (
			SIZE => 2 )
		port map (
			clk => clk, 
			enb => '1', 
			rst => '0', 
			d => word_size_select, 
			q => word_size_save );

	word_size_combination : nRegister 
		generic map (
			SIZE => 4 ) 
		port map (
			clk => clk, 
			enb => '1', 
			rst => '0', 
			d => word_size_comb_i, 
			q => word_size_comb_o );

	start_save_reg : Register_1b 
		port map (
			clk => clk, 
			enb => '1', 
			rst => '0', 
			d => start, 
			q => start_save );			

	counter8 : counter_shift 
		generic map (
			SIZE => 4 ) 
		port map (
			clk => clk, 
			rst => start, 
			repeat_count => rep_c8, 
			q => counter_8_bits);

	counter9 : counter_shift 
		generic map (
			SIZE => 5 ) 
		port map (
			clk => clk, 
			rst => start, 
			repeat_count => rep_count_o_p2(4), 
			q => counter_9_bits );

	counter10 : counter_shift 
		generic map (
			SIZE => 6 ) 
		port map (
			clk => clk, 
			rst => start, 
			repeat_count => rep_count_o_p2(3), 
			q => counter_10_bits );

	counter11 : counter_shift 
		generic map (
			SIZE => 7 ) 
		port map (
			clk => clk, 
			rst => start, 
			repeat_count => rep_count_o_p2(2), 
			q => counter_11_bits );

	counter12 : counter_shift 
		generic map (
			SIZE => 8 ) 
		port map (
			clk => clk, 
			rst => start, 
			repeat_count => rep_count_o_p2(1), 
			q => counter_12_bits );

	counter13 : counter_shift 
		generic map (
			SIZE => 9 ) 
		port map (
			clk => clk, 
			rst => start,
			repeat_count => rep_count_o_p2(0), 
		 	q => counter_13_bits );
	
	repeat_count_pip1 : nRegister 
		generic map (
			SIZE => 6 ) 
		port map (
			clk => clk, 
			enb => '1', 
			rst => start, 
			d => rep_count_i_p1, 
			q => rep_count_o_p1 );

	repeat_count_pip2 : nRegister 
		generic map (
			SIZE => 6 ) 
		port map (
			clk => clk, 
			enb => '1', 
			rst => start, 
			d => rep_count_i_p2, 
			q => rep_count_o_p2 );

	data_ready_pip1 : nRegister 
		generic map (
			SIZE => 3 ) 
		port map (
			clk => clk, 
			enb => '1', 
			rst => start, 
			d => data_ready_i_p1, 
			q => data_ready_o_p1 );

	data_ready_pip2 : nRegister 
		generic map (
			SIZE => 2 ) 
		port map (
			clk => clk, 
			enb => '1', 
			rst => start, 
			d => data_ready_i_p2, 
			q => data_ready_o_p2 );

	data_ready_pip3 : Register_1b 
		port map (
			clk => clk, 
			enb => '1', 
			rst => start, 
			d => data_ready_i_p3, 
			q => data_ready_o_p3 );

	data_readyR : Register_1b 
		port map (
			clk => clk, 
			enb => '1', 
			rst => start, 
			d => data_ready_o_p3, 
			q => data_ready ); 

	Serial_shift : Shift_Register 
		generic map (
			SIZE => 12 ) 
		port map (
			clk => clk, 
			rst => start, 
			word_formation => word_size_comb, 
			d => serial_bit, 
			q => shift_bits );
	
	finalData : nRegister 
		generic map (
			size => 12 ) 
		port map (
			clk => clk, 
			enb => data_ready, 
			rst => start, 
			d => shift_bits, 
			q => parallel_out );

	word_size_comb_i(3) <= word_size_save(0) or word_size_save(1);		
	word_size_comb_i(2) <= not word_size_save(0) and not word_size_save(1);
	word_size_comb_i(1) <= word_size_save(0) and not word_size_save(1);
	word_size_comb_i(0) <= word_size_save(1);				
	word_size_comb(1) <= word_size_comb_o(3);
	word_size_comb(0) <= word_size_comb_o(0);

	rep_count_i_p1(5) <= word_size_comb_o(2) and bit_slip_s_par;
	rep_count_i_p1(4) <= word_size_comb_o(2) and bit_slip_save;
	rep_count_i_p1(3) <= word_size_comb_o(1) and bit_slip_s_par;
	rep_count_i_p1(2) <= word_size_comb_o(1) and bit_slip_save;
	rep_count_i_p1(1) <= word_size_comb_o(0) and bit_slip_s_par;
	rep_count_i_p1(0) <= word_size_comb_o(0) and bit_slip_save;

	data_ready_i_p1(2) <= counter_11_bits(0) or counter_8_bits(0);
	data_ready_i_p1(1) <= counter_12_bits(0) or counter_9_bits(0);
	data_ready_i_p1(0) <= counter_13_bits(0) or counter_10_bits(0);

	data_ready_i_p2(1) <= data_ready_o_p1(2) or data_ready_o_p1(1);
	data_ready_i_p2(0) <= data_ready_o_p1(0);

	data_ready_i_p3 <= data_ready_o_p2(0) or data_ready_o_p2(1);

	rep_count_i_p2(5) <= rep_count_o_p1(5) and data_ready_o_p3;
	rep_count_i_p2(4) <= rep_count_o_p1(4) and data_ready_o_p3;
	rep_count_i_p2(3) <= rep_count_o_p1(3) and data_ready_o_p3;
	rep_count_i_p2(2) <= rep_count_o_p1(2) and data_ready_o_p3;
	rep_count_i_p2(1) <= rep_count_o_p1(1) and data_ready_o_p3;
	rep_count_i_p2(0) <= rep_count_o_p1(0) and data_ready_o_p3;

	rep_c8 <= rep_count_o_p2(5) or start_save;

end ser2par_A;