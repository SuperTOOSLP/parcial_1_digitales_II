library 	ieee;
use		ieee.std_logic_1164.all;

entity sum4bits is

	port(
	
			A,B:	in std_logic_vector(3 downto 0);
			Co:	in std_logic;
			S:	out std_logic_vector(3 downto 0)
	
	);

end sum4bits;

architecture behavioral of sum4bits is

	signal w: std_logic_vector(3 downto 0);
	
	component fulladder is
		port(
				A,B,Cin:	in std_logic;
				S,Cout:	out std_logic
		);
	end component;

begin
	
	-- LSB
	FA0:	fulladder port map(
								A		=>	A(0),
								B		=>	B(0),
								Cin	=> Co,
								S		=> S(0),
								Cout	=> w(0)
	);
	
	FA1:	fulladder port map(
								A		=>	A(1),
								B		=>	B(1),
								Cin	=> w(0),
								S		=> S(1),
								Cout	=> w(1)
	);
	
	FA2:	fulladder port map(
								A		=>	A(2),
								B		=>	B(2),
								Cin	=> w(1),
								S		=> S(2),
								Cout	=> w(2)
	);
	
	FA3:	fulladder port map(
								A		=>	A(3),
								B		=>	B(3),
								Cin	=> w(2),
								S		=> S(3),
								Cout	=> w(3)
	);

	-- w(3) (carry final) se desprecia

end behavioral;
