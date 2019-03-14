library ieee;
use ieee.std_logic_1164.all;

entity ser2par is 
	generic ( parallelSize : integer := 12   			     -- output parallel word size 
	); 
	port (
		clk : in std_logic ;					     -- input clock 
		start : in std_logic;					     -- start signal 
		serialBit :in std_logic ;				     -- serial bit from the serial line 
		bitslip: in std_logic;					     -- input bitslip 
		frame_size_select :in std_logic_vector (1 downto 0);	     -- adjusted output word size
		data_ready_parallel : out std_logic ;			     -- data is ready at parallelOut to capture
		parallelOut : out std_logic_vector (parallelSize-1 downto 0) -- output parallel word
	);    

end entity ser2par;


architecture ser2par_A of ser2par is
	

component nRegister_F is				    -- generic register changes data on the falling edge 
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

component nRegister is					    -- generic register changes data on the Rising edge 
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


signal rst_counter : std_logic;			-- reset the counter to start count from 1 to (8/10/12)
signal enb_datasize_R: std_logic;		-- enable the select regester to save the value of the dataframe size  
signal data_ready_out: std_logic;		-- data ready flag to capture the parallel data word
signal count_8 : std_logic;			-- when the counter counts 8 "1000" and the frame size 8
signal count_10 : std_logic;			-- when the counter counts 10 "1010" and the frame size 10
signal count_12 : std_logic;			-- when the counter counts 12 "1100" and the frame size 12
signal count_0 : std_logic;			-- when the counter counts 0 "0000"
signal count_1 : std_logic;			-- when the counter counts 1 "0001"
signal frame_size: std_logic_vector (1 downto 0);			-- the saved dataframe size 
signal count : std_logic_vector(3 downto 0);				-- the counter value of the shifted bits 
signal shift_word_in : std_logic_vector (parallelSize-1 downto 0);	-- input to Reg_shift that shift the data 1 bit based on the dataframe size 
signal shifted_word: std_logic_vector (parallelSize-1 downto 0);	-- output of Reg_shift the value shifted by the serial bit 

begin 

Reg_select : nRegister
	generic map(
		size => 2) 
	port map (
		clk => clk,
		enb => enb_datasize_R,
		rst => '0',
		d  => frame_size_select,
		q => frame_size 
	);

Reg_shift : nRegister
	generic map(
		size => parallelSize) 
	port map (
		clk => clk,
		enb => '1',
		rst => start,
		d => shift_word_in,
		q => shifted_word 
	);

counter_4b_f : counter_f 
  	generic map (
		n=>4)
  	port map ( 
		clk =>clk,
		start =>start,
		rst =>rst_counter,
   		count =>count 
	);

	process (frame_size,serialBit,shifted_word)
	begin 
			shift_word_in<= (others=>'0');
			if frame_size = "00"  then 
				shift_word_in<= serialBit & shifted_word(11 downto 5) &"0000";
			elsif frame_size = "01"  then 
				shift_word_in<= serialBit & shifted_word(11 downto 3) &"00";
			elsif frame_size = "10" or frame_size = "11"   then 
				shift_word_in<= serialBit & shifted_word(11 downto 1) ;
			end if ;

	end process;
	
count_8  <=  count(3) and not(count(2) or count(1) or count(0) or frame_size(1) or frame_size(0));
count_10 <= count(3) and  count(1) and frame_size(0) and not( count(2) or count(0) or frame_size(1));
count_12 <= count(3) and count(2) and not(count(1) or count(0)) and frame_size(1);
count_0  <=  not( count(3) or  count(2) or  count(1) or  count(0));
count_1 <= not(count(3) or count(2) or count(1)) and count(0);

data_ready_out <= count_8 or count_10 or count_12 ;	-- data ready is when the count reaches the size of the word size 
enb_datasize_R <= start or count_0 or count_1;		-- enable the dataframe size to read at the begining of every 
							-- new word when count=1, if it changed twice inside one frame 
							-- the last frame size will capture in the next word 
rst_counter <= data_ready_out ;				-- reset the counter when the data is ready based on the size of the frame 
data_ready_parallel <= data_ready_out ;			-- parallel word is constructed capture the valid word 
parallelOut <= shifted_word;				-- out to parallel line 


end ser2par_A;



