
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:59:22 02/01/2017
-- Design Name:   DEC4x16
-- Module Name:   C:/Users/elvircrn/Documents/codes2/80085/80085/decodertest.vhd
-- Project Name:  80085
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DEC4x16
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

ENTITY decodertest_vhd IS
END decodertest_vhd;

ARCHITECTURE behavior OF decodertest_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DEC4x16
	PORT(
		enc : IN std_logic_vector(3 downto 0);
		en : IN std_logic;          
		dec : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL en :  std_logic := '0';
	SIGNAL enc :  std_logic_vector(3 downto 0) := (others=>'0');

	--Outputs
	SIGNAL dec :  std_logic_vector(15 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: DEC4x16 PORT MAP(
		enc => enc,
		en => en,
		dec => dec
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		
		en <= '1';
		
		enc <= "1111";
		
		assert(conv_integer(dec) = 15) report "Belaj" severity note;

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
