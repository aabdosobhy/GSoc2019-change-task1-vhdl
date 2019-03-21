
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity Register_1b is
	
	port( 
		clk :in std_logic;			    -- input clock 
		enb : in std_logic;			    -- input enable write 
		rst :in std_logic;			    -- input reset 
		d : in std_logic;			    -- input data to register
		q : out std_logic			    -- output data of the register 
	); 
end Register_1b;

architecture Register_1b_A OF Register_1b IS

begin

	process (clk,rst)
	
	begin
		if rst = '1' then
			q <= '0';
		elsif rising_edge(clk) and enb='1'  then
			q <= d;
		end if ;
	end process ;


end Register_1b_A;
