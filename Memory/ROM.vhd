-- Simple generic RAM Model
--
-- +-----------------------------+
-- |    Copyright 2008 DOULOS    |
-- |   designer :  JK            |
-- +-----------------------------+

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity ROM is
  port (
    clock   : in  std_logic;
	 enable 	: in  std_logic;
    address : in  std_logic_vector(3 downto 0);
    dataout : out  std_logic_vector(2 downto 0)
  );
end entity ROM;

architecture RTL of ROM is
   type ram_type is array (0 to 15) of std_logic_vector(2 downto 0);
   signal ram : ram_type;
	
begin
	ram(0) <= "011";
	ram(1) <= "110";
	ram(2) <= "001";
	ram(3) <= "110";
	ram(4) <= "001";
	ram(5) <= "001";
	ram(6) <= "000";
	ram(7) <= "110";
	ram(8) <= "001";
	ram(9) <= "110";
	ram(10) <= "001";
	ram(11) <= "110";
	ram(12) <= "110";
	ram(13) <= "010";
	ram(14) <= "101";
	ram(15) <= "010";
	
	RamProc: process(clock) is
		begin
			if rising_edge(clock) then
				if enable = '1' then
					dataout <= ram(to_integer(unsigned(address)));
				end if;
		end if;
	end process RamProc;
	
end architecture RTL;