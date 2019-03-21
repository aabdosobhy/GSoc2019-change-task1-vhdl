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
		parallelOut : out std_logic_vector (parallelSize-1 downto 0) -- output parallel word
	);    

end entity ser2par;


architecture ser2par_A of ser2par is

component Register_1b is
    
    port( 
        clk :in std_logic;              -- input clock 
        enb : in std_logic;             -- input enable write 
        rst :in std_logic;              -- input reset 
        d : in std_logic;               -- input data to register
        q : out std_logic               -- output data of the register 
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

component Shift_Register is
	generic (
	 	size : integer := 12
	);
	port( 
		clk :in std_logic;			    -- input clock 
		rst :in std_logic;			    -- input reset 
		d : in std_logic;			    -- input shift data
		q : out std_logic_vector(size-1 downto 0)   -- output data of the register 
	); 
end component;

component counter_shift is
	generic (
	 	size : integer := 12
	);
	port( 
		clk :in std_logic;			    -- input clock 
		rst :in std_logic;			    -- input reset 
		q : out std_logic_vector(size-1 downto 0)   -- output data of the register 
	); 
end component;




signal bitSlip_save:std_logic;				-- register to save the bitslip signal 
signal frame_size_save : std_logic_vector (1 downto 0);	-- register to save the parallel word size 
signal repeatCounter : std_logic;			-- reset all the counters to 100...0 to repeat the shifting again for the new word
signal dataready: std_logic;				-- enable bit to save the word constructed in the finalData register 
signal counter8_bits: std_logic_vector(7 downto 0 );	-- shift register of 8-bits acts as a counter for the word-size 8 and no bitslip 
signal counter9_bits: std_logic_vector(8 downto 0 );	-- shift register of 9-bits acts as a counter for the word-size 8 and bitslip  
signal counter10_bits: std_logic_vector(9 downto 0 );	-- shift register of 10-bits acts as a counter for the word-size 10 and no bitslip 
signal counter11_bits: std_logic_vector(10 downto 0 );	-- shift register of 11-bits acts as a counter for the word-size 10 and bitslip 
signal counter12_bits: std_logic_vector(11 downto 0 );	-- shift register of 12-bits acts as a counter for the word-size 12 and no bitslip 
signal counter13_bits: std_logic_vector(12 downto 0 );	-- shift register of 13-bits acts as a counter for the word-size 12 and bitslip 
signal shiftbits : std_logic_vector(11 downto 0);	-- shift register of 12-bits that shifts the serial data every clk cycle 
signal pipeline_in , pipeline_out: std_logic_vector (5 downto 0); -- divide a long path of combinational logic gates by a register 
signal bit3_out , bit2_out, bit1_out, bit0_out: std_logic;	-- temp signals for masking the LSB of the parallel data 
signal word_formation : std_logic_vector (11 downto 0);		-- combining the parallel data to be transmit in that signal 

begin 


bitslip_reg : Register_1b port map (clk,counter8_bits(7),start,bitslip,bitSlip_save);    
frame_size : nRegister generic map (size=>2) port map (clk,counter8_bits(7),'0',frame_size_select, frame_size_save);
counter8: counter_shift generic map (size=> 8) port map  (clk, repeatCounter , counter8_bits);
counter9: counter_shift generic map (size=> 9) port map  (clk, repeatCounter , counter9_bits);
counter10: counter_shift generic map (size=> 10) port map  (clk, repeatCounter , counter10_bits);
counter11: counter_shift generic map (size=> 11) port map  (clk, repeatCounter , counter11_bits);
counter12: counter_shift generic map (size=> 12) port map  (clk, repeatCounter , counter12_bits);
counter13: counter_shift generic map (size=> 13) port map  (clk, repeatCounter , counter13_bits);

Serial_shift: Shift_Register generic map (size=> 12) port map  (clk, start,serialBit , shiftbits);
piplinedata : nRegister generic map (size => 6) port map ( clk ,'1', start,pipeline_in, pipeline_out);
data_readyR: Register_1b port map(clk ,'1',start,repeatCounter,dataready); 

finalData :  nRegister generic map (size => 12) port map ( clk ,dataready,start,word_formation, parallelOut);



pipeline_in(5) <=(counter8_bits(1) and not( frame_size_save(0)) and not ( frame_size_save(1)) and not (bitSlip_save));
pipeline_in(4) <=(counter9_bits(1) and not( frame_size_save(0)) and not ( frame_size_save(1)) and bitSlip_save)  ;
pipeline_in(3) <=(counter10_bits(1) and  frame_size_save(0) and not ( frame_size_save(1)) and not (bitSlip_save)) ;
pipeline_in(2) <=(counter11_bits(1) and  frame_size_save(0) and not ( frame_size_save(1)) and (bitSlip_save)) ;
pipeline_in(1) <=(counter12_bits(1) and  ( frame_size_save(1)) and not (bitSlip_save)) ;
pipeline_in(0) <=(counter13_bits(1) and  ( frame_size_save(1)) and (bitSlip_save)) ;


repeatCounter <= pipeline_out(5) or pipeline_out(4)or pipeline_out(3) 
		or pipeline_out(2) or pipeline_out(1) or pipeline_out(0) or start;



bit3_out <= shiftbits(3) and (frame_size_save(1) or frame_size_save(0)); 
bit2_out <= shiftbits(2) and (frame_size_save(1) or frame_size_save(0));
bit1_out <= shiftbits(1) and frame_size_save(1);
bit0_out <=shiftbits(0) and frame_size_save(1);

word_formation<=shiftbits(11 downto 4) & bit3_out & bit2_out & bit1_out & bit0_out;


end ser2par_A;
 


