library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is 
		generic ( data_size : integer := 12   -- input and output size 
		); 
		port (input1,input2,input3,input4 : in std_logic_vector(data_size-1 downto 0);  -- four inputs to the mux 
                    selection	:  in std_logic_vector (1 downto 0);				-- selection lines 
  		   output : out std_logic_vector(data_size-1 downto 0));    			-- output of the mux 
end entity mux4_1;


architecture mux4_1_A of mux4_1 is
begin
     
   output <=  input1 when selection="00" 
	else input2 when selection="01" 
	else input3 when selection="10"
	else input4 when selection="11";



     
end mux4_1_A;
