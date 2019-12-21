--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:18:26 12/21/2019
-- Design Name:   
-- Module Name:   C:/hg/Memory/Ram_TB.vhd
-- Project Name:  Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sync_ram
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
 
ENTITY Ram_TB IS
END Ram_TB;
 
ARCHITECTURE behavior OF Ram_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sync_ram
    PORT(
         clock : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         reset : IN  std_logic;
         address : IN  std_logic_vector(3 downto 0);
         datain : IN  std_logic_vector(2 downto 0);
         dataout : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal reset : std_logic := '0';
   signal address : std_logic_vector(3 downto 0) := (others => '0');
   signal datain : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal dataout : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sync_ram PORT MAP (
          clock => clock,
          wr => wr,
          rd => rd,
          reset => reset,
          address => address,
          datain => datain,
          dataout => dataout
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 55 ns;	

      wait for clock_period*10;
     	reset <= '1';
      wr <= '1';
      rd <= '0';
		address <= "0010";
		datain  <= "101";

      wait for clock_period*10;
      wr <= '0';
      rd <= '1';
		address <= "0010";
		datain  <= "001";
		
      wait for clock_period*10;
     	reset <= '0';
      wr <= '1';
      rd <= '0';
		address <= "0010";
		datain  <= "101";
		
		wait for clock_period*10;
     	reset <= '1';
      wr <= '0';
      rd <= '1';
		address <= "0010";
		
      wait for clock_period*10;
      wr <= '1';
      rd <= '0';
		address <= "0100";
		datain  <= "011";
		
      wait for clock_period*10;
      wr <= '1';
      rd <= '0';
		address <= "0110";
		datain  <= "100";
		
      wait for clock_period*10;
      wr <= '0';
      rd <= '1';
		address <= "0100";
		datain  <= "101";
		
		
      wait;
   end process;

END;
