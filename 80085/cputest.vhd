LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY cputest_vhd IS
END cputest_vhd;

ARCHITECTURE behavior OF cputest_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT cpu
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;    
		podaci : buffer std_logic_vector(15 downto 0);      
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

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
