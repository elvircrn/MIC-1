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
   0 =>  "01100000010000000000000001010010", 
	82 => "10010000000110100000000000000000",
	83 => "01010000000000000000101001011000",
	84 => "01001000000000000110101000000000",
	85 => "00000000000110110001101100000000",
	86 => "00000000000100010001000100000000",
	87 => "01110010000110101010101001010011",
	88 => "00010000000100010000101100000000",
	 others => "00000000000000000000000000000000");
begin
   process (address)
   begin
		data <= my_rom(conv_integer(address));
   end process;
end architecture behavioral;

