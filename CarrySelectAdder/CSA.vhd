----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ali Faraji
-- 
-- Create Date:    18:09:42 11/29/2019 
-- Design Name: 
-- Module Name:    CSA - Structure 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: FA - MUX2to1
--
-- Revision: 1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CSA is
	Port ( 	  A, B	 : in  STD_LOGIC_VECTOR (3 downto 0);
				  Cin		 : in  STD_LOGIC;
				  S		 : out  STD_LOGIC_VECTOR (3 downto 0);
				  Cout    : out  STD_LOGIC);
end CSA;

architecture Structure of CSA is
	component FA is
		Port (
				A, B	: in  STD_LOGIC;
				Cin	: in  STD_LOGIC;
				S		: out  STD_LOGIC;
				Cout	: out  STD_LOGIC);
	end Component FA;
	
	-- 4 Bit Carry Select Adder with K=2 ( 4/2 = 2 level )
	component Mux2to1 is
		generic(BITS : natural);
		Port (
				I0, I1	: in  STD_LOGIC_VECTOR (BITS-1 downto 0);
				S 			: in  STD_LOGIC;
				O 			: out STD_LOGIC_VECTOR (BITS-1 downto 0) );
	end Component Mux2to1;
	signal levelCarry ,c0, c1, c2, c3, c4, CO0, CO1 : STD_LOGIC;
	signal Sum1, Sum0 : STD_LOGIC_VECTOR (3 downto 2);
	signal CarryOut : STD_LOGIC_VECTOR (0 downto 0);
begin
	-- This is first level without mux, this level take Cin A(0-1), B(0-1) and Output is LevelCarry for muliplexer select line and sum(0-1)
	FA_v0_Cin : FA port map(A => A(0), B => B(0), Cin => Cin, Cout => c0, S => S(0));
	FA_v1_Cin : FA port map(A => A(1), B => B(1), Cin => c0, Cout => levelCarry, S => S(1));
	
	-- This is Level with assume Carry in is 1
	FA_v2_C1 : FA port map(A => A(2), B => B(2), Cin => '1', Cout => c1, S => Sum1(2));
	FA_v3_C1 : FA port map(A => A(3), B => B(3), Cin => c1, Cout => CO1 , S => Sum1(3));
	
	-- This is Level with assume Carry in is 0
	FA_v2_C0 : FA port map(A => A(2), B => B(2), Cin => '0', Cout => c2, S => Sum0(2));
	FA_v3_C0 : FA port map(A => A(3), B => B(3), Cin => c2, Cout => CO0, S => Sum0(3));
	
	
	--MUX for 2nd level in order to select which assumtion were correct.
	sumMux : Mux2to1 generic map(BITS => 2) port map(I0 => Sum0, I1 => sum1, S => levelCarry, O => S(3 downto 2));
	coutMux : Mux2to1 generic map(BITS => 1) port map(I0 => "" & CO0, I1 => "" & CO1, S => levelCarry, O => CarryOut);
	Cout <= CarryOut(0);
end Structure;

