
library ieee;
use ieee.std_logic_1164.all;


-- este es el multiplexor 4 - 1

entity mux_4_1_4bits is

	 -- el I0 es la Not(A), I1 para A-B, I2 el comparador, I3 para A+B
	 
	port(I	:	in std_logic_vector(3 downto 0);		-- 4 entradas
		  S	:  in std_logic_vector(1 downto 0);		-- selector
		  Y	:  out std_logic);							-- 1 salida
					
		  
end mux_4_1_4bits;


architecture behavioral of mux_4_1_4bits is

	begin

		with S select	-- logica del mux
		
		Y <= I(0) when "00",
			  I(1) when "01",
			  I(2) when "10",
			  I(3) when "11",
			  '0'  when others;
  

end behavioral;
