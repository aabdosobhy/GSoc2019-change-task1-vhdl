library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;  


entity counter_R is
  	generic (
		n:integer :=4
	); 
  	Port ( 
		clk: in std_logic;			   	-- input clock
		start: in std_logic;				-- input start system 
		rst : in std_logic;			   	-- counter Reset  
   		count : out std_logic_vector( n-1 downto 0 )	-- counter output 
	);
end counter_R;

architecture counter_R_A of counter_R is
  
	signal count_int:  unsigned( n-1 downto 0 ) ;  
 
begin
	count<= std_logic_vector(count_int);   
          
  	process (clk)
  	begin
		if rising_edge(clk) then              	
			if rst ='1' or start ='1' then 
				count_int <= ( others=>'0');       
      			else
        			count_int <= count_int +1;     
      			end if;
    		end if;
  	end process;

end counter_R_A;

