----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:55:11 01/05/2017 
-- Design Name: 
-- Module Name:    zad2 - Behavioral 
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
USE ieee.numeric_std.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity ROM256x32 is
  port ( address : in std_logic_vector(7 downto 0);
         data : out std_logic_vector(31 downto 0) );
end entity ROM256x32;

architecture behavioral of ROM256x32 is
  type mem is array ( 0 to 2**8 - 1) of std_logic_vector(31 downto 0);
  constant my_Rom : mem := (
    0  => "00000001100100100010011100000000",
	 1 => "00000001100100100010011000000000",
	 
	 others => "00000000000000000000000000000000");
begin
   process (address)
   begin
		data <= my_rom(conv_integer(address));
   end process;
end architecture behavioral;

