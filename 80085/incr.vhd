library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity incrementer is
	port (
		a    : in std_logic_vector(7 downto 0);
		ainc : out std_logic_vector(7 downto 0);
		en   : in std_logic
	);
end incrementer;

architecture Behavioral of incrementer is

begin
	process(en)
	begin
		if (en'event and en = '1') then
			ainc <= a + 1;
		end if;
	end process;
end Behavioral;

