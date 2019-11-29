--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:05:52 11/29/2019
-- Design Name:   
-- Module Name:   C:/Users/aliwin/Desktop/VHDL/CarrySaveAdder/CSA_TB.vhd
-- Project Name:  CarrySaveAdder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CSA
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
 
ENTITY CSA_TB IS
END CSA_TB;
 
ARCHITECTURE behavior OF CSA_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CSA
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CSA PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A <= "1001";
		B <= "0011";
		cin <= '0';

      wait for 100 ns;	
		A <= "1111";
		B <= "1111";
		cin <= '1';

      wait for 100 ns;	
		A <= "0000";
		B <= "0000";
		cin <= '1';

      wait for 100 ns;	
		A <= "1010";
		B <= "0101";
		cin <= '0';

      wait for 100 ns;	
		A <= "1010";
		B <= "0101";
		cin <= '1';

      wait for 100 ns;	
		A <= "0001";
		B <= "0100";
		cin <= '1';

      wait;
   end process;

END;
