Library IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY HalfAdder IS
	PORT( A, B		:	IN STD_LOGIC;
		 Cout, Sum	:	OUT STD_LOGIC); 
		 
END HalfAdder;

ARCHITECTURE STRUCTURE OF HalfAdder IS

BEGIN
	Sum <= ( A NAND ( A NAND B) ) NAND (B NAND (A NAND B ) );
	Cout <= ( A NAND B ) NAND ( A NAND B );

END STRUCTURE;