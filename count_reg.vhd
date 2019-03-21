
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity counter_shift is
	generic (
	 	size : integer := 12
	);
	port( 
		clk :in std_logic;			    -- input clock 
		rst :in std_logic;			    -- input reset 
		q : out std_logic_vector(size-1 downto 0)   -- output data of the register 
	); 
end counter_shift;

architecture rtl OF counter_shift IS

signal temp :std_logic_vector(size-1 downto 0);
begin

	process (clk,rst)
	
	begin
		if rst = '1' then
			temp<= ((size -1 ) => '1' ,others=>'0');

		elsif rising_edge(clk) then

			 temp <= '0' & temp( size-1 downto 1);

		end if ;
	end process ;
q <= temp;

end rtl;
