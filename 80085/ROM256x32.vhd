library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;


entity ROM256x32 is
  port ( address : in std_logic_vector(7 downto 0);
         data : out std_logic_vector(31 downto 0) );
end entity ROM256x32;

architecture behavioral of ROM256x32 is
  type mem is array ( 0 to 2**8 - 1) of std_logic_vector(31 downto 0);
  constant my_Rom : mem := (
	 0 => "01100000000100100111001000000000", -- sp := sp + (-1); goto 0;
	 1 => "10011000000100010000000000000000", -- ac := inv(mbr);
	 others => "00000000000000000000000000000000");
begin
   process (address)
   begin
		data <= my_rom(conv_integer(address));
   end process;
end architecture behavioral;

