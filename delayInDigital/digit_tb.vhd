--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:06:47 12/14/2019
-- Design Name:   
-- Module Name:   C:/hg/delayInDigital/digit_tb.vhd
-- Project Name:  delayInDigital
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shiftReg
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
 
ENTITY digit_tb IS
END digit_tb;
 
ARCHITECTURE behavior OF digit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shiftReg
    PORT(
         Inputs : IN  std_logic_vector(3 downto 0);
         Outputs : OUT  std_logic_vector(3 downto 0);
         Reset : IN  std_logic;
         LR : IN  std_logic_vector(1 downto 0);
         Load : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Inputs : std_logic_vector(3 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Outputs : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shiftReg PORT MAP (
          Inputs => Inputs,
          Outputs => Outputs,
          Reset => Reset,
          LR => LR,
          Load => Load,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Reset <= '1';
		
      wait for CLK_period*10;
      Inputs <= "1010";
		Reset <= '0';
		LR <= "00";
		Load <= '1';
		
		wait for CLK_period*10;
      Inputs <= "1110";
		LR <= "01";
		Load <= '0';
		
		wait for CLK_period*2;
      Inputs <= "1011";
		Reset <= '0';
		LR <= "10";
		Load <= '0';
		
		wait for CLK_period*2;
      Inputs <= "1000";
		Reset <= '0';
		LR <= "11";
		Load <= '0';
		
		wait for CLK_period*2;
      Inputs <= "1110";
		LR <= "00";
		Load <= '1';
      wait;
   end process;

END;
