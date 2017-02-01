----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:23 01/12/2017 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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

entity cpu is
    port (
             clk : in std_logic;
             reset : in std_logic;
             adresa : out std_logic_vector (11 downto 0);
             podaci : inout std_logic_vector (12 downto 0);
-- preko signal podaci procesor šalje ili dobavlja podatke od U/I ureðaja
             rd : out std_logic;
             wr : out std_logic
         );
end cpu;

architecture Behavioral of cpu is

signal s_mpc_reg : std_logic_vector (7 downto 0) :=x"00";
signal s_mir_reg : std_logic_vector (31 downto 0);
signal s_rom_out : std_logic_vector (31 downto 0);

begin

	-- distributer impulsa
	p_fazni_sat : distributer port map (clk, reset, s_t4, s_t3, s_t2, s_t1);

end Behavioral;























