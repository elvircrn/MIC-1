----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:26:48 02/01/2017 
-- Design Name: 
-- Module Name:    DEC4x16 - Behavioral 
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

use ieee.numeric_std.all;

-- 4 to 16 bit decoder
entity decoder is
	port ( enc : in std_logic_vector(3 downto 0);
			 en : in std_logic;
			 dec : out std_logic_vector(15 downto 0)
	);
end decoder;

architecture Behavioral of decoder is
begin
process(enc, en) 
begin
	if(en = '1') then
		dec <= (others => '0');
		dec(conv_integer(enc)) <= '1';
	end if;
end process;
end Behavioral;






