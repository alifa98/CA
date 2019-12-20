--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:49:21 11/09/2019
-- Design Name:   
-- Module Name:   F:/sequential_detector/det_tb.vhd
-- Project Name:  sequential_detector
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: det
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY det_tb IS
END det_tb;
 
ARCHITECTURE behavior OF det_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT det
    PORT(
         input : IN  std_logic;
         output : OUT  std_logic_vector(1 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: det PORT MAP (
          input => input,
          output => output,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		input <= '0';
      wait for 10 ns;
		input <= '1';
      wait for 10 ns;
		input <= '0';
      wait for 10 ns;
		input <= '1';
      wait for 10 ns;
		input <= '1';
      wait for 10 ns;
		input <= '0';
      wait for 10 ns;
		input <= '1';
      wait for 10 ns;
		input <= '1';
      wait for 10 ns;
		input <= '0';
      wait for 10 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
