----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:59 01/05/2017 
-- Design Name: 
-- Module Name:    hex2u1mux - Behavioral 
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

entity hex2u1mux is
port(
        x0, x1 : in std_logic_vector(15 downto 0);
        y0 : out std_logic_vector(15 downto 0);
        c : in std_logic
);
end hex2u1mux;

architecture Behavioral of hex2u1mux is

begin

y0 <= x1 when c = '1' else
                x0;

end Behavioral;

