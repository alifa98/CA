--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:15:20 12/21/2019
-- Design Name:   
-- Module Name:   C:/hg/Memory/DualPortRAM_TB.vhd
-- Project Name:  Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Dual_Port_ram
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
 
ENTITY DualPortRAM_TB IS
END DualPortRAM_TB;
 
ARCHITECTURE behavior OF DualPortRAM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dual_Port_ram
    PORT(
         clock : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         reset : IN  std_logic;
         write_address : IN  std_logic_vector(3 downto 0);
         read_address : IN  std_logic_vector(3 downto 0);
         datain : IN  std_logic_vector(2 downto 0);
         dataout : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal reset : std_logic := '0';
   signal write_address : std_logic_vector(3 downto 0) := (others => '0');
   signal read_address : std_logic_vector(3 downto 0) := (others => '0');
   signal datain : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal dataout : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dual_Port_ram PORT MAP (
          clock => clock,
          wr => wr,
          rd => rd,
          reset => reset,
          write_address => write_address,
          read_address => read_address,
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
      wait for 100 ns;	
wait for clock_period*10;

     	reset <= '1';
      wr <= '1';
      rd <= '0';
		write_address <=	"0010";
		read_address <=	"0100";
		datain  <= 			"101";
		
		wait for clock_period*10;
      wr <= '1';
      rd <= '1';
		write_address <=	"0000";
		read_address <=	"0010";
		datain  <= 			"111";
		
		wait for clock_period*10;
      wr <= '1';
      rd <= '1';
		write_address <=	"1111";
		read_address <=	"0000";
		datain  <= 			"100";
		
		wait for clock_period*10;
     	reset <= '0';
      wr <= '1';
      rd <= '1';
		write_address <=	"0010";
		read_address <=	"0000";
		datain  <= 			"111";
		
		wait for clock_period*10;
     	reset <= '1';
      wr <= '0';
      rd <= '1';
		write_address <=	"1100";
		read_address <=	"0010";
		datain  <= 			"101";
		
		wait for clock_period*10;
      wr <= '0';
      rd <= '1';
		write_address <=	"0010";
		read_address <=	"1100";
		datain  <= 			"101";
      wait;
   end process;

END;
