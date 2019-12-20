library IEEE;
use IEEE.std_logic_1164.all;
Entity or_gate is
 Port(
 Ao, Bo: in std_logic;
 Co : out std_logic
 );
End entity or_gate;
Architecture gatelevel of or_gate is
Begin
 Co <= Ao or Bo;
End gatelevel;