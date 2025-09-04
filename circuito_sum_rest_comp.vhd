
library ieee;
use ieee.std_logic_1164.all;


-- este es el circuito top que tiene la entrada A y B de 4 bits

entity circuito_sum_rest_comp is
	 
	port(A_in		:	in std_logic_vector(3 downto 0);		-- entrada A
		  B_in		:  in std_logic_vector(3 downto 0);		-- entrada B
		  Sel		:  in std_logic_vector(1 downto 0);		-- selector
		  Salida	:  out std_logic);							-- salida
					
		  
end circuito_sum_rest_comp;


architecture behavioral of circuito_sum_rest_comp is

	signal cable_comparador	:	std_logic_vector(3 downto 0);
	
	-- aqui están cada uno de los elementos
	
	-- sumador
	
	-- restador
	component restador_4_bits is
	
	port (A 		    : in std_logic_vector(3 downto 0); -- Operando A
			B         : in std_logic_vector(3 downto 0); -- Operando B
			RESULT    : out std_logic_vector(3 downto 0)); -- Resultado de la resta
	
	end component;
	
	------------------------------------------------------------------------------
	
	-- comparador
	component comparador is
	
	port(A				:	in  std_logic_vector(3 downto 0);	-- entrada A
		  B				:  in  std_logic_vector(3 downto 0);	-- entrada B
		  comparacion	:  out std_logic_vector(3 downto 0));				
		  
	end component;
	------------------------------------------------------------------------------
	
	-- multiplexor 4:1
	component mux_4_1_4bits is
	
	port(I	:	in std_logic_vector(3 downto 0);		-- 4 entradas
		  S	:  in std_logic_vector(1 downto 0);		-- selector
		  Y	:  out std_logic);							-- 1 salida
	
	end component;
	------------------------------------------------------------------------------

	begin
	
	 Comparardor_4_bits :	comparador port map(A => A_in, 
															  B => B_in,
															  comparacion => cable_comparador);
	
	 -- Multiplexor_4_1	:	mux_4_1_4bits port map(I(0) => negacion,
    --								-  				  I(1) => RESULT,
			--												  I(2) => cable_comparador,
				--											  I(3) => suma
				--										  	  );
	

  

end behavioral;
