library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter16 is
  port ( data_in : in std_logic_vector(15 downto 0);
			s0 : in std_logic;
			s1 : in std_logic;
         data_out : out std_logic_vector(15 downto 0) );
end shifter16;

architecture Behavioral of shifter16 is

begin
	process(data_in, s0, s1)
   begin
		if s0 = '0' and s1 = '1' then
			data_out <= to_stdlogicvector(to_bitvector (data_in) srl 1);
		elsif s0 = '1' and s1 = '0' then
			data_out <= to_stdlogicvector (to_bitvector (data_in) sll 1);
		else 
			data_out <= data_in;
		end if;
   end process;

end Behavioral;

