

library		ieee;
use			ieee.std_logic_1164.all;

entity notA is

		port(
		
			A:		in std_logic_vector(3 downto 0);
			OutA: out std_logic_vector(3 downto 0));

end notA;

architecture behavioral of notA is

		begin
		
		OutA	<=	not A;
		
end behavioral;
