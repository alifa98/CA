----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:02:41 11/02/2019 
-- Design Name: 
-- Module Name:    comparator_fourBit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
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

entity comparator_fourBit is
Port(
	A_f :in std_logic_vector(3 downto 0); 
	B_f :in std_logic_vector(3 downto 0); 
	G_f, E_f, L_f: out std_logic
 );
end comparator_fourBit;

architecture structure of comparator_fourBit is

component comparator_oneBit is
Port(
 A, B, Gin, Ein, Lin: in std_logic;
 G, E, L: out std_logic
 );
End component comparator_oneBit;

signal G_sig :std_logic_vector(3 downto 1);
signal E_sig :std_logic_vector(3 downto 1); 
signal L_sig :std_logic_vector(3 downto 1); 

begin

 comparator3: comparator_oneBit port map ( A => A_f(3), B => B_f(3), Gin => '0', Ein=> '1', Lin => '0' , G => G_sig(3), E => E_sig(3), L => L_sig(3));
 comparator2: comparator_oneBit port map ( A => A_f(2), B => B_f(2), Gin => G_sig(3), Ein=> E_sig(3), Lin => L_sig(3) , G => G_sig(2), E => E_sig(2), L => L_sig(2));
 comparator1: comparator_oneBit port map ( A => A_f(1), B => B_f(1), Gin => G_sig(2), Ein=> E_sig(2), Lin => L_sig(2) , G => G_sig(1), E => E_sig(1), L => L_sig(1));
 comparator0: comparator_oneBit port map ( A => A_f(0), B => B_f(0), Gin => G_sig(1), Ein=> E_sig(1), Lin => L_sig(1) , G => g_f, E => E_f, L => L_f);
 
end structure;

