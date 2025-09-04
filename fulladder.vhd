

library 	ieee;
use		ieee.std_logic_1164.all;

entity fulladder is

		port(
		
			A,B,Cin:		in std_logic;
			S,Cout:		out std_logic
		
		);

end fulladder;

architecture behavioral of fulladder is

	signal w: std_logic_vector(2 downto 0) := "000";
	
	component halfadder is
	
		port(
		
				A,B: 		in std_logic;
				S,Cout:	Out std_logic
		
		);
		
	end component;
	
	begin
	
	Hf1:	halfadder port map(
	
						A 		=> A,
						B 		=> B,
						S		=> w(0),
						Cout	=>	w(1)
	
	);
	
	Hf2:	halfadder port map(
	
						A		=> w(0),
						B		=> Cin,
						S		=> S,
						Cout	=>	w(2)
	
	);
	
	Cout	<=	w(1) or w(2);

end behavioral;