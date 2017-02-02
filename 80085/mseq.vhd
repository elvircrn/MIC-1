----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:02 02/01/2017 
-- Design Name: 
-- Module Name:    mseq - Behavioral 
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

entity mseq is
	port(
		cond : in std_logic_vector(1 downto 0);
		n, z : in std_logic;
		seq_out : out std_logic
	);
end mseq;

architecture Behavioral of mseq is

begin
process(cond, n, z)
begin
	seq_out <= (cond(1) and cond(0)) or 
		(cond(0) and n) or
		(cond(1) and z);
end process;
end Behavioral;

