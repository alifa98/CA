----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:52:12 12/23/2019 
-- Design Name: 
-- Module Name:    CAM - Behavioral 
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
use IEEE.Numeric_Std.all;

entity CAM is
  port (
    clock   : in  std_logic;
    rw      : in  std_logic; -- 1 means write and 0 means read.
    reset      : in  std_logic;
    data  : in  std_logic_vector(2 downto 0);
    match  : out std_logic
  );
end entity CAM;

architecture RTL of CAM is

   type ram_type is array (0 to 15) of std_logic_vector(2 downto 0);
   signal ram : ram_type;
   signal validBit : std_logic_vector(15 downto 0) := (others => '0');
	
begin
	CamProc: process(clock, reset) is
		begin
			if reset = '0' then
				validBit <=(others => '0');
				
			elsif rising_edge(clock) then
				if rw = '0' then
					L1: for i in 0 to 15 loop
						if validBit(i)= '1' and ram(i) = data then
							match <= '1';
							exit L1;
						elsif to_unsigned(i,4) = to_unsigned(15,4) then
							match <= '0';
							exit L1;
						end if;
					end loop L1;
				else
					L2: for i in 0 to 15 loop
						if validBit(i)= '0' then
							validBit(i) <= '1';
							ram(i) <= data;
							exit L2;
						end if;
						end loop L2;
				end if;
		end if;
	end process CamProc;
				
end architecture RTL;
