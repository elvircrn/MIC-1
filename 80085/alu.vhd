----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:50:38 01/05/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
        port (
				 x1, x2 : in std_logic_vector(15 downto 0);
				 f0, f1 : in std_logic;
				 y0 : out std_logic_vector(15 downto 0);
				 z, n : out std_logic
        );
end ALU;

architecture Behavioral of ALU is
signal y : STD_LOGIC_VECTOR (15 downto 0);
begin 
y <= (x1 + x2) when (f1 = '0' and f0 = '0') else
          (x1 and x2) when (f1 = '0' and f0 = '1') else
          x1 when (f1 = '1' and f0 = '0') else
          (not x1) when (f1 = '1' and f0 = '1');

z <= (y(0) or y(1) or y(2) or y(3) or y(4) 
or y(5) or y(6) or y(7) or y(8) or y(9) 
or y(10) or y(11) or y(12) or y(13) or y(14) 
or y(15));

n <= y(15);

y0 <= y;

end Behavioral;

