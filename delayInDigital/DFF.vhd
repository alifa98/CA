----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:49 11/15/2019 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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
Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFF is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic    
   );
end DFF;
architecture Behavioral of DFF is  
begin  
 process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q <= D;
    end if;       
 end process;  
end Behavioral; 
