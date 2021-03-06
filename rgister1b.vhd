library ieee;
use ieee.std_logic_1164.all;

entity Register_1b is
	port(
		clk : in std_logic;		-- clock
		enb : in std_logic;		-- enable write
		rst : in std_logic;		-- reset
		d : in std_logic;		-- data to register
		q : out std_logic		-- o/p data register
	);
end Register_1b;

architecture rtl OF Register_1b is

begin
	process (clk, rst)
	begin
		if rst = '1' then
			q <= '0';

		elsif rising_edge(clk) and enb = '1'  then
			q <= d;

		end if;
	end process;

end rtl;