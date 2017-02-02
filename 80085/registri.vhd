library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registri is
	port (
		a_adr : in std_logic_vector (15 downto 0);
		b_adr : in std_logic_vector (15 downto 0);
		c_adr : in std_logic_vector (15 downto 0);
		enc : in std_logic;
		reset : in std_logic;
		a_bus : out std_logic_vector (15 downto 0);
		b_bus : out std_logic_vector (15 downto 0);
		c_bus : in std_logic_vector (15 downto 0)
	);
end registri;

architecture Behavioral of registri is

signal pc : std_logic_vector (15 downto 0) := x"0000";
signal ac : std_logic_vector (15 downto 0) := x"0000";
signal sp : std_logic_vector (15 downto 0) := x"0000";
signal ir : std_logic_vector (15 downto 0) := x"0000";
signal tir : std_logic_vector (15 downto 0) := x"0000";
signal zero : std_logic_vector (15 downto 0) := x"0000";
signal p_one : std_logic_vector (15 downto 0) := x"0001";
signal n_one : std_logic_vector (15 downto 0) := x"FFFF";
signal amask : std_logic_vector (15 downto 0) := x"0000";
signal smask : std_logic_vector (15 downto 0) := x"0000";
signal a : std_logic_vector (15 downto 0) := x"0000";
signal b : std_logic_vector (15 downto 0) := x"0000";
signal c : std_logic_vector (15 downto 0) := x"0000";
signal d : std_logic_vector (15 downto 0) := x"0000";
signal e : std_logic_vector (15 downto 0) := x"0000";
signal f : std_logic_vector (15 downto 0) := x"0000";

begin
	process (a_adr, b_adr, c_adr, c_bus, reset, enc)
	begin
	

		-- iz registra na sabirnicu
		case a_adr is
			when "0000000000000001" => a_bus <= pc;
			when "0000000000000010" => a_bus <= ac;
			when "0000000000000100" => a_bus <= sp;
			when "0000000000001000" => a_bus <= ir;
			when "0000000000010000" => a_bus <= tir;
			when "0000000000100000" => a_bus <= zero;
			when "0000000001000000" => a_bus <= p_one;
			when "0000000010000000" => a_bus <= n_one;
			when "0000000100000000" => a_bus <= amask;
			when "0000001000000000" => a_bus <= smask;
			when "0000010000000000" => a_bus <= a;
			when "0000100000000000" => a_bus <= b;
			when "0001000000000000" => a_bus <= c;
			when "0010000000000000" => a_bus <= d;
			when "0100000000000000" => a_bus <= e;
			when "1000000000000000" => a_bus <= f;
			when others => null;
		end case;
			case b_adr is
			when "0000000000000001" => b_bus <= pc;
			when "0000000000000010" => b_bus <= ac;
			when "0000000000000100" => b_bus <= sp;
			when "0000000000001000" => b_bus <= ir;
			when "0000000000010000" => b_bus <= tir;
			when "0000000000100000" => b_bus <= zero;
			when "0000000001000000" => b_bus <= p_one;
			when "0000000010000000" => b_bus <= n_one;
			when "0000000100000000" => b_bus <= amask;
			when "0000001000000000" => b_bus <= smask;
			when "0000010000000000" => b_bus <= a;
			when "0000100000000000" => b_bus <= b;
			when "0001000000000000" => b_bus <= c;
			when "0010000000000000" => b_bus <= d;
			when "0100000000000000" => b_bus <= e;
			when "1000000000000000" => b_bus <= f;
			when others => b_bus <= "ZZZZZZZZZZZZZZZZ";
		end case;
		-- sa sabirnice u registar
		
		if (enc = '1') then
			case c_adr is
				when "0000000000000001" => pc <= c_bus;
				when "0000000000000010" => ac <= c_bus;
				when "0000000000000100" => sp <= c_bus;
				when "0000000000001000" => ir <= c_bus;
				when "0000000000010000" => tir <= c_bus;
				when "0000000000100000" => zero <= zero;
				when "0000000001000000" => p_one <= p_one;
				when "0000000010000000" => n_one <= n_one;
				when "0000000100000000" => amask <= c_bus;
				when "0000001000000000" => smask <= c_bus;
				when "0000010000000000" => a <= c_bus;
				when "0000100000000000" => b <= c_bus;
				when "0001000000000000" => c <= c_bus;
				when "0010000000000000" => d <= c_bus;
				when "0100000000000000" => e <= c_bus;
				when "1000000000000000" => f <= c_bus;
				when others => null;
			end case;
		end if;
	end process;
end Behavioral;