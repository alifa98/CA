----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:36 11/29/2019 
-- Design Name: 
-- Module Name:    Mux2to1 - Behavioral 
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

entity Mux2to1 is
	generic(BITS : natural);
	Port ( I0, I1	: in  STD_LOGIC_VECTOR (BITS-1 downto 0);
			 S 	: in  STD_LOGIC;
			 O 	: out STD_LOGIC_VECTOR (BITS-1 downto 0));
end Mux2to1;

architecture Behavioral of Mux2to1 is

begin
	process(I0, I1, S) is
	begin
		if(S = '0') then
			O <= I0;
		else 
			O <= I1;
		end if;
	end process;

end Behavioral;

