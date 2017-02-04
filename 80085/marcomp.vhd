library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity marcomp is
	port (
		s_t3, s_mar : in std_logic;
		s_b_latch : in std_logic_vector(15 downto 0);
		adresa : out std_logic_vector (11 downto 0)
	);
end marcomp;

architecture Behavioral of marcomp is
	signal mar_latch : std_logic_vector(11 downto 0);
begin

process(s_t3)
	variable v_mar_latch : std_logic_vector(11 downto 0);
begin
	if (s_t3 = '1' and s_mar = '1') then
		v_mar_latch := s_b_latch(11 downto 0);
		adresa <= v_mar_latch;
		mar_latch <= v_mar_latch;
	end if;
end process;
end Behavioral;

