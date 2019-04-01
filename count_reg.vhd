library ieee;
use ieee.std_logic_1164.all;

entity counter_shift is
	generic(
		SIZE : integer := 12
	);
   port( 
		clk : in std_logic;		-- clock 
		rst : in std_logic;		-- reset 
		repeat_count : in std_logic;
		q : out std_logic_vector(SIZE -1 downto 0)	-- o/p data register 
	); 
end counter_shift;

architecture rtl of counter_shift is

signal temp : std_logic_vector(size-1 downto 0);

begin

	process (clk, rst)
	begin
		if rst = '1' then
			temp<= (others => '0');

		elsif rising_edge(clk) then
			 temp <= repeat_count & temp(SIZE -1 downto 1);
			 
		end if;
	end process;
q <= temp;

end rtl;