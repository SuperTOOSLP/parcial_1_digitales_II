

library ieee;
use ieee.std_logic_1164.all;


entity comparador is
	 
	 port(A		    	:  in  std_logic_vector(3 downto 0);	-- entrada A
		  B		   	    :  in  std_logic_vector(3 downto 0);	-- entrada B
		  comparacion	:  out std_logic_vector(3 downto 0));	
		  
end comparador;


architecture behavioral of comparador is

	 -- W1 para A3 xor B3, --W2 para A2 xor B2, --W3 para A1 xor B1, --W4 para A0 xor B0
	 signal W3, W2, W1, W0 	:	std_logic	:=	'0';
	 

	begin
	
	W3 <= (not(A(3) xor B(3)));
	W2 <= (not(A(2) xor B(2)));
   W1 <= (not(A(1) xor B(1)));
	W0 <= (not(A(0) xor B(0)));
	
	comparacion(3) <= W3 and W2 and W1 and W0;
	
   comparacion(2) <= (A(3) and not(B(3))) or (W3 and (A(2) and not(B(2)))) or ((W3 and W2) and (A(1) and not(B(1)))) or (W3 and W2 and W1 and A(0) and not(B(0)));
	
	comparacion(1) <= (B(3) and not(A(3))) or (W3 and B(2) and not(A(2))) or (W3 and W2 and B(1) and not(A(1))) or (W3 and W2 and W1 and B(0) and not(A(0)));
	
	comparacion(0) <= '0';
	
end behavioral;

