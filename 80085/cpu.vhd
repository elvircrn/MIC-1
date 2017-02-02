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
             podaci : inout std_logic_vector (15 downto 0);
             rd : out std_logic;
             wr : out std_logic
         );
end cpu;

architecture Behavioral of cpu is

signal s_mpc_reg : std_logic_vector (7 downto 0) :=x"00";
signal s_mir_reg : std_logic_vector (31 downto 0);
signal s_rom_out : std_logic_vector (31 downto 0);
signal s_mir : std_logic_vector(31 downto 0);
signal s_t1, s_t2, s_t3, s_t4 : std_logic;
signal s_amux : std_logic; 
signal s_cond, s_alu, s_sh : std_logic_vector(1 downto 0);
signal s_mbr, s_mar, s_rd, s_wr, s_enc : std_logic;
signal s_c, s_b, s_a : std_logic_vector(3 downto 0);
signal s_mir_adresa : std_logic_vector(7 downto 0);
signal s_mpc_out, s_mpc_out_inc : std_logic_vector(7 downto 0);
signal s_a_dek_out, s_b_dek_out, s_c_dek_out : std_logic_vector(15 downto 0);
signal s_a_latch, s_b_latch : std_logic_vector(15 downto 0);
signal s_amux_out : std_logic_vector(15 downto 0);
signal s_mar_latch, s_mbr_latch : std_logic_vector(15 downto 0);
signal s_alu_out : std_logic_vector(15 downto 0);
signal s_z, s_n : std_logic;
signal s_c_bus : std_logic_vector(15 downto 0);
signal s_seq_out : std_logic;
signal s_mmux_out : std_logic_vector(7 downto 0);

--Registri
signal pc : std_logic_vector (15 downto 0) := x"0000";
signal ac : std_logic_vector (15 downto 0) := x"0000";
signal sp : std_logic_vector (15 downto 0) := x"0000";
signal ir : std_logic_vector (15 downto 0) := x"0000";
signal tir : std_logic_vector (15 downto 0) := x"0000";
signal zero : std_logic_vector (15 downto 0) := x"0000" ;
signal p_one : std_logic_vector (15 downto 0) := x"0001";
signal n_one : std_logic_vector (15 downto 0) := x"1111";
signal amask : std_logic_vector (15 downto 0) := x"0000";
signal smask : std_logic_vector (15 downto 0) := x"0000";
signal a : std_logic_vector (15 downto 0) := x"0000";
signal b : std_logic_vector (15 downto 0) := x"0000";
signal c : std_logic_vector (15 downto 0) := x"0000";
signal d : std_logic_vector (15 downto 0) := x"0000";
signal e : std_logic_vector (15 downto 0) := x"0000";
signal f : std_logic_vector (15 downto 0) := x"0000";

component distributer
	port (
	clk, reset : in std_logic;
	t1, t2, t3, t4 : out std_logic
	);
end component; 

component ALU
	port(
		x1, x2 : in std_logic_vector(15 downto 0);
		f0, f1 : in std_logic;
		y0 : out std_logic_vector(15 downto 0);
		z, n : out std_logic	);
end component;

component ROM256x32
  port ( address : in std_logic_vector(7 downto 0);
         data : out std_logic_vector(31 downto 0) );
end component;

component decoder
		port ( enc : in std_logic_vector(3 downto 0);
			 en  : in std_logic;
			 dec : out std_logic_vector(15 downto 0));
end component;

component mseq 
	port(
		cond : in std_logic_vector(1 downto 0);
		n, z : in std_logic;
		seq_out : out std_logic
	);
end component;

component registri
	port (
		a_adr : in std_logic_vector (15 downto 0);
		b_adr : in std_logic_vector (15 downto 0);
		c_adr : in std_logic_vector (15 downto 0);
		reset : in std_logic;
		a_bus : out std_logic_vector (15 downto 0);
		b_bus : out std_logic_vector (15 downto 0);
		c_bus : in std_logic_vector (15 downto 0)
	);
end component;

component shifter16
	  port ( data_in : in std_logic_vector(15 downto 0);
			s0 : in std_logic;
			s1 : in std_logic;
         data_out : out std_logic_vector(15 downto 0) );
end component;

component hex2u1mux 
port(
        x0, x1 : in std_logic_vector(15 downto 0);
        y0 : out std_logic_vector(15 downto 0);
        c : in std_logic
);
end component;

component oct2to1mux
port(
        x0, x1 : in std_logic_vector(7 downto 0);
        y0 : out std_logic_vector(7 downto 0);
        c : in std_logic
);
end component;

begin

--TODO
--Popraviti (potencijalno) n_one registar
--Testirati shifter
--Testirati pisanje u mar i mbr
--Testirati vise od jedne instrukcije
--Testirati control flow
--Koristiti reset za resetovanje registara 
--Implementovati U/I komunikaciju
--Odvojiti registre u posebnu komponentu (ne znam treba li)

--Mapiranje
p_fazni_sat : distributer port map (clk, reset, s_t1, s_t2, s_t3, s_t4);
rom : rom256x32 port map (s_mpc_out, s_rom_out);
decoder_1 : decoder port map (s_a, '1', s_a_dek_out);
decoder_2 : decoder port map (s_b, '1', s_b_dek_out);
decoder_3 : decoder port map (s_c, '1', s_c_dek_out);
p_alu: alu port map (s_amux_out, s_b_latch, s_alu(0), s_alu(1), s_alu_out, s_z, s_n);
p_sifter: shifter16 port map (s_alu_out, s_sh(1), s_sh(0), s_c_bus);
p_mseq: mseq port map(s_cond, s_n, s_z, s_seq_out);
mmux : oct2to1mux port map(s_mpc_out_inc, s_mir_adresa, s_mmux_out, s_seq_out);
amux : hex2u1mux port map (s_a_latch, s_mbr_latch, s_amux_out, s_amux);

--Ciklus 1
process (s_t1, s_rom_out)
	variable v_mir : std_logic_vector (31 downto 0);
	begin
		if s_t1 = '1' then
			v_mir := s_rom_out;
			s_amux <= v_mir(31);
			s_cond <= v_mir(30 downto 29);
			s_alu <= v_mir(28 downto 27);
			s_sh <= v_mir(26 downto 25);
			s_mbr <= v_mir(24);
			s_mar <= v_mir(23);
			s_rd <= v_mir(22);
			s_wr <= v_mir(21);
			s_enc <= v_mir(20);
			s_c <= v_mir(19 downto 16);
			s_b <= v_mir(15 downto 12);
			s_a <= v_mir(11 downto 8);
			s_mir_adresa <= v_mir(7 downto 0);
		end if;
		s_mir <= v_mir;
	end process;

--Ciklus 2
process(s_t2, s_a_dek_out, s_b_dek_out)
begin
 if s_t2 = '1' then
 s_mpc_out_inc <= s_mpc_out + '1';
 case s_a_dek_out is
	when "0000000000000001" => s_a_latch <= pc;
	when "0000000000000010" => s_a_latch <= ac;
	when "0000000000000100" => s_a_latch <= sp;
	when "0000000000001000" => s_a_latch <= ir;
	when "0000000000010000" => s_a_latch <= tir;
	when "0000000000100000" => s_a_latch <= zero;
	when "0000000001000000" => s_a_latch <= p_one;
	when "0000000010000000" => s_a_latch <= n_one;
	when "0000000100000000" => s_a_latch <= amask;
	when "0000001000000000" => s_a_latch <= smask;
	when "0000010000000000" => s_a_latch <= a;
	when "0000100000000000" => s_a_latch <= b;
	when "0001000000000000" => s_a_latch <= c;
	when "0010000000000000" => s_a_latch <= d;
	when "0100000000000000" => s_a_latch <= e;
	when "1000000000000000" => s_a_latch <= f;
	when others => null;
 end case;
 case s_b_dek_out is
	when "0000000000000001" => s_b_latch <= pc;
	when "0000000000000010" => s_b_latch <= ac;
	when "0000000000000100" => s_b_latch <= sp;
	when "0000000000001000" => s_b_latch <= ir;
	when "0000000000010000" => s_b_latch <= tir;
	when "0000000000100000" => s_b_latch <= zero;
	when "0000000001000000" => s_b_latch <= p_one;
	when "0000000010000000" => s_b_latch <= n_one;
	when "0000000100000000" => s_b_latch <= amask;
	when "0000001000000000" => s_b_latch <= smask;
	when "0000010000000000" => s_b_latch <= a;
	when "0000100000000000" => s_b_latch <= b;
	when "0001000000000000" => s_b_latch <= c;
	when "0010000000000000" => s_b_latch <= d;
	when "0100000000000000" => s_b_latch <= e;
	when "1000000000000000" => s_b_latch <= f;
	when others => null;
 end case;
 end if;
end process;

--Ciklus 3
process(s_t3, s_b_latch, s_mar)
 variable v_mar_latch : std_logic_vector(11 downto 0);
begin
 if (s_t3 = '1' and s_mar = '1') then
 v_mar_latch := s_b_latch(11 downto 0);
 end if;
 adresa <= v_mar_latch;
 s_mar_latch <= "0000" & v_mar_latch;
end process;

--Ciklus 4
process(s_t4, s_mbr, s_rd, s_wr, s_enc, s_c, s_c_bus, s_mmux_out)
 variable v_c_dek_out : std_logic_vector(15 downto 0);
begin
 if (s_t4 = '1') then
	s_mpc_out <= s_mmux_out;
	 if (s_enc = '1') then
		case s_c_dek_out is
			when "0000000000000001" => pc <= s_c_bus;
			when "0000000000000010" => ac <= s_c_bus;
			when "0000000000000100" => sp <= s_c_bus;
			when "0000000000001000" => ir <= s_c_bus;
			when "0000000000010000" => tir <= s_c_bus;
			when "0000000000100000" => null;
			when "0000000001000000" => null;
			when "0000000010000000" => null;
			when "0000000100000000" => amask <= s_c_bus;
			when "0000001000000000" => smask <= s_c_bus;
			when "0000010000000000" => a <= s_c_bus;
			when "0000100000000000" => b <= s_c_bus;
			when "0001000000000000" => c <= s_c_bus;
			when "0010000000000000" => d <= s_c_bus;
			when "0100000000000000" => e <= s_c_bus;
			when "1000000000000000" => f <= s_c_bus;
			when others => null;
		end case;
	 end if;
		 if s_mbr = '1' then
			s_mbr_latch <= s_c_bus;
		 end if;
		 if s_rd = '1' then
			s_mbr_latch <= podaci;
		 end if;
		 if s_wr = '1' then
			podaci <= s_mbr_latch;
		 end if;
 end if;
end process;

end Behavioral;






















