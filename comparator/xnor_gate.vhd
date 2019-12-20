library IEEE;
use IEEE.std_logic_1164.all;
Entity xnor_gate is
 Port(
 Ax, Bx: in std_logic;
 Cx : out std_logic
 );
End entity xnor_gate;
Architecture gatelevel of xnor_gate is
Begin
 Cx <= Ax xnor Bx;
End gatelevel;