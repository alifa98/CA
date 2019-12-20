----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:50:01 12/14/2019 
-- Design Name: 
-- Module Name:    RegSeven - Behavioral 
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

entity RegSeven is
port(
		Inputs : in STD_LOGIC_VECTOR(3 downto 0);
		Reset: in STD_LOGIC;
		LR : in STD_LOGIC_VECTOR(1 downto 0);
		Load : in STD_LOGIC;
		CLK, CLK_reset : in STD_LOGIC;
		Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0);
		segcell: out STD_LOGIC
	);
end RegSeven;

architecture Structure of RegSeven is
	component bcd_7segment is
		Port (
				BCDin : in STD_LOGIC_VECTOR (3 downto 0);
				Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0)
			);
	end Component bcd_7segment;
	
	component shiftReg is
		port(
			Inputs : in STD_LOGIC_VECTOR(3 downto 0);
			Outputs : out STD_LOGIC_VECTOR(3 downto 0);
			Reset: in STD_LOGIC;
			LR : in STD_LOGIC_VECTOR(1 downto 0);
			Load : in STD_LOGIC;
			CLK, CLK_reset : in STD_LOGIC
		);
	end Component shiftReg;
	
	signal tempout : STD_LOGIC_VECTOR(3 downto 0);
begin
	segcell <= '1';
	shiftReg_instance: shiftReg port map ( Inputs => Inputs, Reset => Reset, LR => LR, Load => Load, CLK => CLK, CLK_reset => CLK_reset, Outputs => tempout);
	bcd_7segment_instance: bcd_7segment port map ( BCDin => tempout, Seven_Segment => Seven_Segment);
end Structure;

