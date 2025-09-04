
library ieee;
use ieee.std_logic_1164.all;

entity circuito_sum_rest_comp is
	 
	port(
	
		  A_in	: in  std_logic_vector(3 downto 0);	-- entrada A
		  B_in	: in  std_logic_vector(3 downto 0);	-- entrada B
		  Sel		: in  std_logic_vector(1 downto 0);	-- selector
		  Salida	: out std_logic_vector(3 downto 0)	-- salida de 4 bits
		  
	);
	
end circuito_sum_rest_comp;


architecture behavioral of circuito_sum_rest_comp is

	-- señales internas
	signal cable_notA     : std_logic_vector(3 downto 0);
	signal cable_suma     : std_logic_vector(3 downto 0);
	signal cable_resta    : std_logic_vector(3 downto 0);
	signal cable_comp     : std_logic_vector(3 downto 0);
	
	--------------------------------------------------------------
	-- aqui están cada uno de los elementos
	--------------------------------------------------------------
	
	-- not A
	component notA is
		port(
			A    : in  std_logic_vector(3 downto 0);
			OutA : out std_logic_vector(3 downto 0)
		);
	end component;
	
	--------------------------------------------------------------
	
	-- sumador
	component sum4bits is
		port(
			A,B : in std_logic_vector(3 downto 0);
			Co  : in std_logic;
			S   : out std_logic_vector(3 downto 0)
		);
	end component;
	
	--------------------------------------------------------------
	
	-- restador
	component restador4bits is
		port(
			A,B    : in  std_logic_vector(3 downto 0);
			RESULT : out std_logic_vector(3 downto 0)
		);
	end component;
	
	---------------------------------------------------------------
	
	-- comparador
	component comparador is
		port(
			A,B         : in  std_logic_vector(3 downto 0);
			comparacion : out std_logic_vector(3 downto 0)
		);
	end component;
	
	---------------------------------------------------------------
	
	-- multiplexor 4:1 de 4 bits
	component mux_4_1_4bits is
		port(
			I0, I1, I2, I3 : in  std_logic_vector(3 downto 0);
			S              : in  std_logic_vector(1 downto 0);
			Y              : out std_logic_vector(3 downto 0)
		);
	end component;
	
	---------------------------------------------------------------

	begin
	
	
				U1: notA port map(
				
									A => A_in, 
									OutA => cable_notA
									
									);
	
				U2: sum4bits port map(
				
									A => A_in,
									B => B_in,
									Co => '0',
									S => cable_suma
									
									);
	
				U3: restador4bits port map(
				
									A => A_in,
									B => B_in,
									RESULT => cable_resta
									
									);
	
				U4: comparador port map(
				
									A => A_in,
									B => B_in,
									comparacion => cable_comp
									
									);
	
				U5: mux_4_1_4bits port map(
	
									I0 => cable_notA,
									I1 => cable_resta,
									I2 => cable_comp,
									I3 => cable_suma,
									S  => Sel,
									Y  => Salida
	);

end behavioral;
