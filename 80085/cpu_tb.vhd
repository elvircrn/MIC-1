LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY cpu_tb_vhd IS
END cpu_tb_vhd;

ARCHITECTURE behavior OF cpu_tb_vhd IS 

	COMPONENT cpu
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;    
		podaci : buffer std_logic_vector(15 downto 0); -- mbr
		adresa : OUT std_logic_vector(11 downto 0);   -- mar
		rd : OUT std_logic;
		wr : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL reset :  std_logic := '0';

	--BiDirs
	SIGNAL podaci :  std_logic_vector(15 downto 0):= x"0004";

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
			podaci <= x"0004";

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		clk <= '0';
		--reset <= '1';
		wait for 100 ns;
		--reset <= '0';
		

		for i in 0 to 600000 loop
			wait for 100 ns;
			clk <= clk xor '1';
		end loop;
				
		wait; -- will wait forever
	END PROCESS;

END;
