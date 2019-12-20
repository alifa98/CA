----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:11:15 11/09/2019 
-- Design Name: 
-- Module Name:    clock_devider - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;

entity clock_devider is
    generic ( n : integer := 40000000; 
              m : integer := 1);            -- n must be the multiple of m
    port    ( in_freq   : in   std_logic;
              out_freq  : out  std_logic;
              reset     : in  std_logic);
end clock_devider;

architecture behavioral of clock_devider is
    signal step : std_logic;
    signal counter : integer range 0 to n/m;

begin
	process (in_freq, reset) 
	begin
	   if reset = '0' then 
            step <= '0';
            counter <= 0;	   
	   elsif ( in_freq'event and in_freq = '1') then
			if (counter < n/m) then
				counter <= counter + 1;		
            else
				step <= not step;
				counter <= 1;
			end if;
		end if;
	end process;
    out_freq <= step;
end behavioral;


