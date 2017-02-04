library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mpc is
	port(
		s_t : in std_logic;
		s_mmux_out : in std_logic_vector(7 downto 0);
		s_mpc_reg_out : out std_logic_vector(7 downto 0) := x"00"	
	);
end mpc;

architecture Behavioral of mpc is
	signal mpc_reg : std_logic_vector(7 downto 0) := x"00";
begin
	process(s_t)
	begin
		if(s_t'event and s_t = '1') then
			mpc_reg <= s_mmux_out;
			s_mpc_reg_out <= s_mmux_out;
		end if;
	end process;

end Behavioral;

