library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity distributer is
	port (
		clk, reset : in std_logic;
		t1, t2, t3, t4 : out std_logic
	);
end distributer;

architecture Behavioral of distributer is
	signal temp: std_logic_vector(1 downto 0) := "00";
begin

	process(clk)
	begin
		if (reset = '1') then
	     temp <= "00";
		elsif (clk'event and clk = '1') then
			if (temp = "11") then
				temp <= "00";
			else	 
				temp <= temp + '1';
			end if;
		end if;
	
		case temp is
			when "00" => t1 <= '1'; t2 <= '0'; t3 <= '0'; t4 <= '0';
			when "01" => t2 <= '1'; t1 <= '0'; t3 <= '0'; t4 <= '0'; 
			when "10" => t3 <= '1'; t2 <= '0'; t1 <= '0'; t4 <= '0';
			when "11" => t4 <= '1'; t2 <= '0'; t3 <= '0'; t1 <= '0';
			when others => null;
		end case;
	end process;
end Behavioral;