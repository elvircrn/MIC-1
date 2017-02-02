
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:27:40 02/02/2017
-- Design Name:   cpu
-- Module Name:   C:/Users/Amar.B/Desktop/LD/80085/80085/cpu_tb.vhd
-- Project Name:  80085
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY cpu_tb_vhd IS
END cpu_tb_vhd;

ARCHITECTURE behavior OF cpu_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT cpu
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;    
		podaci : INOUT std_logic_vector(15 downto 0);      
		adresa : OUT std_logic_vector(11 downto 0);
		rd : OUT std_logic;
		wr : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL reset :  std_logic := '0';

	--BiDirs
	SIGNAL podaci :  std_logic_vector(15 downto 0);

	--Outputs
	SIGNAL adresa :  std_logic_vector(11 downto 0);
	SIGNAL rd :  std_logic;
	SIGNAL wr :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: cpu PORT MAP(
		clk => clk,
		reset => reset,
		adresa => adresa,
		podaci => podaci,
		rd => rd,
		wr => wr
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		clk <= '0';
		wait for 100 ns;
		clk <= '1';
		wait for 100 ns;

		clk <= '0';
		wait for 100 ns;
		clk <= '1';
		wait for 100 ns;
		
		clk <= '0';
		wait for 100 ns;
		clk <= '1';
		wait for 100 ns;
		
		clk <= '0';
		wait for 100 ns;
		clk <= '1';
		wait for 100 ns;
		
		wait; -- will wait forever
	END PROCESS;

END;
