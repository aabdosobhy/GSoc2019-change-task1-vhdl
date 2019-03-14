
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity nRegister is
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
end nRegister;

architecture nRegister_A OF nRegister IS

begin

	process (clk,rst)
	
	begin
		if rst = '1' then
			q <= (others=>'0');
		elsif rising_edge(clk) and enb='1'  then
			q <= d;
		end if ;
	end process ;


end nRegister_A;