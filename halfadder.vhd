

library 	ieee;
use		ieee.std_logic_1164.all;

entity halfadder is

		port(
		
				A,B: 		in std_logic;
				S,Cout:	Out std_logic
		
		);

end halfadder;

architecture behavioral of halfadder is

	begin
	
	S 		<= A xor B;
	Cout	<= A and B;

end behavioral;