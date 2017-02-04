library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mseq is
	port(
		cond : in std_logic_vector(1 downto 0);
		n, z : in std_logic;
		seq_out : out std_logic
	);
end mseq;

architecture Behavioral of mseq is

begin
process(cond, n, z)
begin
	seq_out <= (cond(1) and cond(0)) or 
		(cond(0) and n) or
		(cond(1) and z);
end process;
end Behavioral;

