library ieee;
use ieee.std_logic_1164.all;

entity Register_1b_qq is	
	port( 
		clk : in std_logic;		-- clock
		enb : in std_logic;		-- enable write
		rst : in std_logic;		-- reset
		d : in std_logic;		-- data to register
		q : out std_logic;		-- o/p data register
		q_not : out std_logic	-- o/p not data register
	); 
end Register_1b_qq;

architecture rtl OF Register_1b_qq is

begin
	process (clk, rst)
	begin
		if rst = '1' then
			q <= '0';
			q_not <= '1';
		elsif rising_edge(clk) and enb='1' then
			q <= d;
			q_not <= not d;
		end if;
	end process;

end rtl;
