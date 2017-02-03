----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:42:32 02/03/2017 
-- Design Name: 
-- Module Name:    mircomp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mircomp is
	port(
		s_mir_reg : inout std_logic_vector (31 downto 0);
		s_rom_out : inout std_logic_vector (31 downto 0);
		s_mir : inout std_logic_vector(31 downto 0);
		s_amux : inout std_logic; 
		s_cond, s_alu, s_sh : inout std_logic_vector(1 downto 0);
		s_mbr, s_mar, s_rd, s_wr, s_enc : inout std_logic;
		s_c, s_b, s_a : inout std_logic_vector(3 downto 0);
		s_mir_adresa : inout std_logic_vector(7 downto 0);
		s_t1 : in std_logic
	);
end mircomp;

architecture Behavioral of mircomp is
--Ciklus 1
begin
process (s_t1)
	variable v_mir : std_logic_vector (31 downto 0);
begin
		if (rising_edge(s_t1)) then
			--s_c_decoded <= '0';
			v_mir := s_rom_out;
			s_amux <= v_mir(31);
			s_cond <= v_mir(30 downto 29);
			s_alu <= v_mir(28 downto 27);
			s_sh <= v_mir(26 downto 25);
			s_mbr <= v_mir(24);
			s_mar <= v_mir(23);
			s_rd <= v_mir(22);
			s_wr <= v_mir(21);
			s_enc <= v_mir(20);
			s_c <= v_mir(19 downto 16);
			s_b <= v_mir(15 downto 12);
			s_a <= v_mir(11 downto 8);
			s_mir_adresa <= v_mir(7 downto 0);
			s_mir <= v_mir; -- Stavio unutar if-a
		end if;
	end process;
		

end Behavioral;

