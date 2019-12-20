--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:47:02 11/02/2019
-- Design Name:   
-- Module Name:   D:/vhdl/secondProject/comparator_fourBit_tb.vhd
-- Project Name:  secondProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparator_fourBit
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
 
ENTITY comparator_fourBit_tb IS
END comparator_fourBit_tb;
 
ARCHITECTURE behavior OF comparator_fourBit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator_fourBit
    PORT(
         A_f : IN  std_logic_vector(3 downto 0);
         B_f : IN  std_logic_vector(3 downto 0);
         G_f : OUT  std_logic;
         E_f : OUT  std_logic;
         L_f : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_f : std_logic_vector(3 downto 0) := (others => '0');
   signal B_f : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal G_f : std_logic;
   signal E_f : std_logic;
   signal L_f : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator_fourBit PORT MAP (
          A_f => A_f,
          B_f => B_f,
          G_f => G_f,
          E_f => E_f,
          L_f => L_f
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A_f <= "1010";
		B_f <= "1010";
		
		 wait for 100 ns;	
		A_f <= "1000";
		B_f <= "1010";
		
		 wait for 100 ns;	
		A_f <= "1010";
		B_f <= "1000";
		
		
		 wait for 100 ns;	
		A_f <= "1110";
		B_f <= "1111";
		
		
		 wait for 100 ns;	
		A_f <= "0111";
		B_f <= "1000";
		
		
		 wait for 100 ns;	
		A_f <= "0101";
		B_f <= "0110";

      -- insert stimulus here 

      wait;
   end process;

END;
