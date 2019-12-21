-- Simple generic RAM Model
--
-- +-----------------------------+
-- |    Copyright 2008 DOULOS    |
-- |   designer :  JK            |
-- +-----------------------------+

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity CAM is
  port (
    clock   : in  std_logic;
    rw      : in  std_logic;
    reset      : in  std_logic;
    datain  : in  std_logic_vector(2 downto 0);
    match  : out std_logic
  );
end entity CAM;

architecture RTL of CAM is

   type ram_type is array (0 to 15) of std_logic_vector(2 downto 0);
   signal ram : ram_type;
   signal validBit : std_logic_vector(15 downto 0) := (others => '0');
	
begin
	
	RamProc: process(clock, reset) is
		begin
			if reset = '0' then
				validBit := (others => '0');
				
			elsif rising_edge(clock) then
				if w = '0' then
					for i in 0 to 15 loop
						if vaidBit(i)= '1' and ram(i) = datain then
							match <= '1';
						end if;
					end loop;
				else
					
				end if;
				
		end if;
	end process RamProc;
				
end architecture RTL;