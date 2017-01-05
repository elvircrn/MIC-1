----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:01 01/05/2017 
-- Design Name: 
-- Module Name:    shifter16 - Behavioral 
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

entity shifter16 is
  port ( data_in : in bit_vector(15 downto 0);
			f0 : in std_logic;
			f1 : in std_logic;
         data_out : out bit_vector(15 downto 0) );
end shifter16;

architecture Behavioral of shifter16 is

begin
	process(data_in, f0, f1)
   begin
		if f0 = '0' and f1 = '1' then
			data_out <= data_in srl 1;
		elsif f0 = '1' and f1 = '0' then
			data_out <= data_in sll 1;
		end if;
   end process;

end Behavioral;

