-- Simple generic RAM Model
--
-- +-----------------------------+
-- |    Copyright 2008 DOULOS    |
-- |   designer :  JK            |
-- +-----------------------------+

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity Dual_Port_ram is
  port (
    clock   : in  std_logic;
    wr      : in  std_logic;
	 rd      : in  std_logic;
	 reset      : in  std_logic;
    write_address : in  std_logic_vector(3 downto 0);
	 read_address : in  std_logic_vector(3 downto 0);
    datain  : in  std_logic_vector(2 downto 0);
    dataout  : out  std_logic_vector(2 downto 0)
  );
end entity Dual_Port_ram;

architecture RTL of Dual_Port_ram is

   type ram_type is array (0 to 15) of std_logic_vector(2 downto 0);
   signal ram : ram_type;
	
begin

	RamProc: process(clock, reset) is
		begin
			if reset = '0' then
				for i in 0 to 15 loop
					ram(i) <= std_logic_vector(to_unsigned(i, 3));
				end loop;
			elsif rising_edge(clock) then
				if wr = '1' then
					ram(to_integer(unsigned(write_address))) <= datain;
				end if;
				if rd = '1' then
					dataout <= ram(to_integer(unsigned(read_address)));
				end if;
		end if;
	end process RamProc;
	
end architecture RTL;