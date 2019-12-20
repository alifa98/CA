----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:17:42 11/09/2019 
-- Design Name: 
-- Module Name:    det_1hz - Behavioral 
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
entity det_1hz is
Port(
input_total, CLK_total, CLK_reset: in std_logic;
output_total : out std_logic_vector (1 downto 0)
);
end entity det_1hz;

architecture structure of det_1hz is

	component clock_devider is
		port    ( in_freq   : in   std_logic;
              out_freq  : out  std_logic;
              reset     : in  std_logic);
	End component clock_devider;
	
	component det is
	port(
		input : in std_logic ;
		output : out std_logic_vector (1 downto 0);
		clk : in std_logic
		);
	end component det;
	
signal clk_sig :std_logic;

begin
	clock_devider_instance0: clock_devider port map ( in_freq => CLK_total, reset => CLK_reset, out_freq => CLK_sig);
	det_instance0: det port map ( input => input_total, clk => CLK_sig, output => output_total);
	
end structure;
