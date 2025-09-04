library ieee;
use ieee.std_logic_1164.all;

entity mux_4_1_4bits is

	-- I0 = Not(A), I1 = A-B, I2 = Comparador, I3 = A+B
	port(
	
	
		I0, I1, I2, I3 : in  std_logic_vector(3 downto 0); -- 4 entradas de 4 bits
		S              : in  std_logic_vector(1 downto 0); -- selector
		Y              : out std_logic_vector(3 downto 0)  -- salida de 4 bits
		
		
	);
end mux_4_1_4bits;

architecture behavioral of mux_4_1_4bits is
		begin
		
			with S select
			
			Y <= I0 when "00",
				  I1 when "01",
				  I2 when "10",
				  I3 when "11",
					"0000" when others;
					
end behavioral;
