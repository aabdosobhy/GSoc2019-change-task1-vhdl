library ieee;
use ieee.std_logic_1164.all;

entity Shift_Register is
	generic(
		SIZE : integer := 12
	);
	port(
		clk : in std_logic;		-- clock 
		rst : in std_logic;		-- reset 
		word_formation : in std_logic_vector(1 downto 0); -- format 4-lSBs
		d : in std_logic;		-- shift data
		q : out std_logic_vector(SIZE -1 downto 0)	-- o/p data register 
	); 
end Shift_Register;

architecture rtl of Shift_Register is

signal temp : std_logic_vector(SIZE -1 downto 0);
signal LS4_Bs : std_logic_vector(3 downto 0);

begin
	process (clk, rst)
	begin
		if rst = '1' then
			temp<= (others => '0');
			
		elsif rising_edge(clk) then
			temp <= d & temp(SIZE -1 downto 1) ;
			LS4_Bs <= (temp(4) and word_formation(1)) &
					  (temp(3) and word_formation(1)) &
					  (temp(2) and word_formation(0)) & 
					  (temp(1) and word_formation(0));
		end if;
	end process;
q <= temp(SIZE -1 downto 4) & LS4_Bs;

end rtl;