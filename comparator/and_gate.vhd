library IEEE;
use IEEE.std_logic_1164.all;
Entity and_gate is
 Port(
 Aa, Ba: in std_logic;
 Ca : out std_logic
 );
End entity and_gate;
Architecture gatelevel of and_gate is
Begin
 Ca <= Aa and Ba;
End gatelevel;