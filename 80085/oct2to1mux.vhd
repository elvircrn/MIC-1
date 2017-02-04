library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity oct2to1mux is
port(
        x0, x1 : in std_logic_vector(7 downto 0);
        y0 : out std_logic_vector(7 downto 0);
        c : in std_logic
);
end oct2to1mux;

architecture Behavioral of oct2to1mux is

begin

process(x0, x1, c)
begin
	if (c = '1') then
		y0 <= x1;
	else
		y0 <= x0;
	end if;
end process;
end Behavioral;
