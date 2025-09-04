
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity restador4bits is

 port (A 		: in std_logic_vector(3 downto 0); -- Operando A
		 B 		: in std_logic_vector(3 downto 0); -- Operando B
       RESULT  : out std_logic_vector(3 downto 0) -- Resultado de la resta
 );
 
end entity restador4bits;

architecture behavioral of restador4bits is

	begin
	
	process(A, B)
 
	begin
 
 -- Resta directa con conversión
 RESULT <= std_logic_vector(
					signed(A) - signed(B));
 
 end process;
 
end architecture behavioral;