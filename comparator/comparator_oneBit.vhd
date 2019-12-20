----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:27:00 11/02/2019 
-- Design Name: 
-- Module Name:    comparator_oneBit - Behavioral 
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

entity comparator_oneBit is
Port(
 A, B, Gin, Ein, Lin: in std_logic;
 G, E, L: out std_logic
 );
end comparator_oneBit;

architecture structure of comparator_oneBit is

component xnor_gate is
Port(
Ax, Bx: in std_logic;
Cx : out std_logic
);
End component xnor_gate;

component or_gate is
Port(
Ao, Bo: in std_logic;
Co : out std_logic
);
End component or_gate;

component and_gate is
Port(
Aa, Ba: in std_logic;
Ca : out std_logic
);
End component and_gate;

component not_gate is
Port(
An : in std_logic;
Cn : out std_logic
);
End component not_gate;

signal not_A, not_B, A_Bnot, B_Anot, A_xnor_B, A_Bnot_Ein, B_Anot_Ein: std_logic;
begin
  xnor_gate_instance0: xnor_gate port map ( Ax => A, Bx => B, Cx => A_xnor_B );
  and_gate_instance0: and_gate port map ( Aa => A_xnor_B, Ba => Ein,  Ca => E );

 not_gate_instance0: not_gate port map ( An => A, Cn => not_A );
 not_gate_instance1: not_gate port map ( An => B, Cn => not_B );
 
 and_gate_instance1: and_gate port map ( Aa => A, Ba => not_B, Ca => A_Bnot );
 and_gate_instance2: and_gate port map ( Aa => not_A, Ba => B, Ca => B_Anot );
 
  and_gate_instance10: and_gate port map ( Aa => A_Bnot, Ba => Ein, Ca => A_Bnot_Ein );
  and_gate_instance11: and_gate port map ( Aa => B_Anot, Ba => Ein, Ca => B_Anot_Ein );

 or_gate_instance0: or_gate port map ( Ao => A_Bnot_Ein, Bo => Gin,  Co => G );
 or_gate_instance1: or_gate port map ( Ao => B_Anot_Ein, Bo => Lin,  Co => L );
 
 

end structure;

