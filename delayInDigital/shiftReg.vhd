----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:11:14 12/14/2019 
-- Design Name: 
-- Module Name:    shiftReg - Behavioral 
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

entity shiftReg is
port(
		Inputs : in STD_LOGIC_VECTOR(3 downto 0);
		Outputs : out STD_LOGIC_VECTOR(3 downto 0);
		Reset: in STD_LOGIC;
		LR : in STD_LOGIC_VECTOR(1 downto 0);
		Load : in STD_LOGIC;
		CLK, CLK_reset : in STD_LOGIC
	);
end shiftReg;


architecture Structure of shiftReg is
	component DFF is
		Port (
			Q : out std_logic;    
			Clk :in std_logic;   
			D :in  std_logic  
		);
	end Component DFF;
	
	component clock_devider is
		    generic ( n : integer := 40000000; 
              m : integer := 1);            -- n must be the multiple of m
    port    ( in_freq   : in   std_logic;
              out_freq  : out  std_logic;
              reset     : in  std_logic);
	end Component clock_devider;
	
	
	signal temp : std_logic_vector(3 downto 0);
	signal divided_clock : std_logic;
begin
	clock_devider_instance0: clock_devider port map ( in_freq => CLK, reset => CLK_reset, out_freq => divided_clock);
	process begin
		wait until rising_edge(CLK);
		if Reset = '1' then
			temp <= "0000";
		elsif(Load = '1') then
			temp <= Inputs;
		elsif(LR = "01") then
			temp(0) <= temp(1);
			temp(1) <= temp(2);
			temp(2) <= temp(3);
			temp(3) <= '0';
		elsif(LR = "10") then
			temp(3) <= temp(2);
			temp(2) <= temp(1);
			temp(1) <= temp(0);
			temp(0) <= '0';
		elsif(LR = "11") then
			temp(0) <= temp(1);
			temp(1) <= temp(2);
			temp(2) <= temp(3);
		end if;
		
		Outputs <= temp;
	end process;
end Structure;

