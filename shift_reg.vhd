
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity Shift_Register is
	generic (
	 	size : integer := 12
	);
	port( 
		clk :in std_logic;			    -- input clock 
		rst :in std_logic;			    -- input reset 
		d : in std_logic;			    -- input shift data
		q : out std_logic_vector(size-1 downto 0)   -- output data of the register 
	); 
end Shift_Register;

architecture rtl OF Shift_Register IS

signal temp :std_logic_vector(size-1 downto 0);
begin

	process (clk,rst)
	
	begin
		if rst = '1' then
			temp<= (others=>'0');
			
		elsif rising_edge(clk) then
			temp <= d & temp( size-1 downto 1);
			
		end if ;
	end process ;
q <= temp;

end rtl;
