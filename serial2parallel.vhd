library ieee;
use ieee.std_logic_1164.all;

entity ser2par is 
	generic ( parallelSize : integer := 12   			     -- output parallel word size 
	); 
	port (
		clk : in std_logic ;					     -- input clock 
		start : in std_logic;					     -- start signal 
		serialBit :in std_logic ;				     -- serial bit from the serial line 
		bitslip: in std_logic_vector( 1 downto 0);		     -- adjusted output word size 
		parallelOut : out std_logic_vector (parallelSize-1 downto 0) -- output parallel word
	);    

end entity ser2par;


architecture ser2par_A of ser2par is
	
component mux4_1 is 
	generic ( 
		data_size : integer := 12   						  -- input and output size 
	); 
	port (
		input1,input2,input3,input4 : in std_logic_vector(data_size-1 downto 0);  -- four inputs to the mux 
		selection:  in std_logic_vector (1 downto 0);				  -- selection lines 
		output : out std_logic_vector(data_size-1 downto 0)    			  -- output of the mux end component;
	);
end component;

component nRegister_F is
	generic (
	 	size : integer := 12
	);
	port( 
		clk :in std_logic;			    -- input clock 
		enb : in std_logic;			    -- input enable write 
		rst :in std_logic;			    -- input reset 
		d : in std_logic_vector(size-1 downto 0);   -- input data to register
		q : out std_logic_vector(size-1 downto 0)   -- output data of the register 
	); 
end component ;
component nRegister is
	generic (
	 	size : integer := 12
	);
	port( 
		clk :in std_logic;			    -- input clock 
		enb : in std_logic;			    -- input enable write 
		rst :in std_logic;			    -- input reset 
		d : in std_logic_vector(size-1 downto 0);   -- input data to register
		q : out std_logic_vector(size-1 downto 0)   -- output data of the register 
	);  
end component;

component counter_f is
  	generic (
		n:integer :=4
	); 
  	Port ( 
		clk: in std_logic;			   	-- input clock
		start: in std_logic;				-- input start system 
		rst : in std_logic;			   	-- counter Reset  
   		count : out std_logic_vector( n-1 downto 0 )	-- counter output 
	);
end component;


component counter_R is
  	generic (
		n:integer :=4
	); 
  	Port ( 
		clk: in std_logic;			   	-- input clock
		start: in std_logic;				-- input start system 
		rst : in std_logic;			   	-- counter Reset  
   		count : out std_logic_vector( n-1 downto 0 )	-- counter output 
	);
end component;





signal select_out: std_logic_vector (1 downto 0);
signal en_write_OutReg : std_logic ;
signal shift_word_out , out_Reg_shift : std_logic_vector (parallelSize-1 downto 0);
signal rst_counter : std_logic;
signal enb_reg_select: std_logic;
signal data_ready_out: std_logic;
signal count :std_logic_vector(3 downto 0);
signal count_8 : std_logic;
signal count_10 : std_logic;
signal count_12 : std_logic;
signal count_0 : std_logic;
signal rst_counter_rising: std_logic;
signal count_rising : std_logic_vector (3 downto 0);
signal countR_0 : std_logic;

signal data_8b : std_logic_vector (6 downto 0); 
signal data_10b: std_logic_vector (8 downto 0 );
signal data_12b: std_logic_vector (10 downto 0 );


begin 

--
--mux_select_shift: mux4_1 
--	generic map ( 
--		data_size=> parallelSize) 
--	port map (
--		input1 => data_8b,
--		input2 => data_10b,
--		input3 => data_12b,
--		input4 => data_12b,
--             	selection => select_out,
--  		output => mux_word_out );


Reg_select : nRegister 
	generic map(
		size => 2) 
	port map (
		clk => clk,
		enb => enb_reg_select,
		rst => '0',
		d => bitslip,
		q => select_out );

Reg_shift : nRegister_F 
	generic map(
		size => parallelSize) 
	port map (
		clk => clk,
		enb => '1',
		rst => start,
		d => shift_word_out,
		q => out_Reg_shift );

Reg_out	: nRegister 
	generic map (
		size => parallelSize)
	port map(
		clk => clk,
		enb => en_write_OutReg,
		rst => start,
		d => out_Reg_shift,
		q => parallelOut );


counter_4b_f : counter_f 
  	generic map (
		n=>4)
  	port map ( 
		clk =>clk,
		start =>start,
		rst =>rst_counter,
   		count =>count );

counter_4b_R : counter_R 
  	generic map (
		n=>4)
  	port map ( 
		clk => clk,
		start => start,
		rst => rst_counter_rising,
   		count => count_rising );

	

	process (clk)
	begin 
		if (falling_edge(clk)) then 

			if select_out = "00" and  start='0' then 
				shift_word_out<= serialBit & data_8b &"0000";

			elsif select_out = "01" and start='0' then 
				shift_word_out<= serialBit & data_10b &"00";

			elsif select_out(1) = '1' and start='0' then 
				shift_word_out<= serialBit & data_12b ;

			end if ;

		end if ;
	end process;




	
count_8  <=  count(3) and (not count(2)) and (not count(1)) and (not count(0)) and (not select_out(1)) and (not select_out(0));
count_10 <= count(3) and (not count(2)) and  count(1) and (not count(0)) and (not select_out(1)) and select_out(0);
count_12 <= count(3) and count(2) and not (count(1)) and (not count(0)) and select_out(1);
count_0  <= (not count(3)) and (not count(2)) and (not count(1)) and (not count(0));
countR_0 <=(not count_rising(3)) and (not count_rising(2)) and (not count_rising(1)) and (not count_rising(0));

data_ready_out	 <= count_8 or count_10 or count_12 ;

enb_reg_select <=  data_ready_out or start;

rst_counter <=countR_0 ;

rst_counter_rising <= count_8 or count_10 or count_12 ;
   		
data_8b  <= out_Reg_shift(11 downto 5);
data_10b <= out_Reg_shift(11 downto 3);
data_12b <= out_Reg_shift(11 downto 1);


end ser2par_A;


