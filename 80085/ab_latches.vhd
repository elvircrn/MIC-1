----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:04:49 02/03/2017 
-- Design Name: 
-- Module Name:    ab_latches - Behavioral 
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

entity ab_latches is
	port(
		s_t : in std_logic;
		s_bus : in std_logic_vector(15 downto 0);
		s_latch_out : out std_logic_vector(15 downto 0)
	);
end ab_latches;

architecture Behavioral of ab_latches is
	signal s_latch : std_logic_vector(15 downto 0);
begin
	process(s_t)
		begin
		if(s_t = '1') then
			s_latch <= s_bus;
			s_latch_out <= s_bus;
		end if;
	end process;
end Behavioral;

