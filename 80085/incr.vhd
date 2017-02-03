----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:45:32 02/03/2017 
-- Design Name: 
-- Module Name:    incr - Behavioral 
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

