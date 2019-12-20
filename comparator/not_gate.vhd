library IEEE;
use IEEE.std_logic_1164.all;
Entity not_gate is
 Port(
 An :in std_logic;
 Cn : out std_logic
 );
End entity not_gate;
Architecture gatelevel of not_gate is
Begin
 Cn <= not An;
End gatelevel;