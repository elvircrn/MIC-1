----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:12 01/05/2017 
-- Design Name: 
-- Module Name:    oct2to1mux - Behavioral 
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

entity oct2to1mux is
port(
        x0, x1 : in std_logic_vector(15 downto 0);
        y0 : out std_logic_vector(15 downto 0);
        c : in std_logic
);
end oct2to1mux;

architecture Behavioral of oct2to1mux is

begin

y0 <= x1 when c = '1' else
                x0;
					 
end Behavioral;

