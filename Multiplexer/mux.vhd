entity oct2u1mux is
port(
        x0, x1 : in std_logic_vector(7 downto 0);
        y0 : out std_logic_vector(7 downto 0);
        c : in std_logic
);
end oct2u1mux;

architecture Behavioral of oct2u1mux is

begin

y0 <= x1 when c = '1' else
                x0;

end Behavioral;

entity hex2u1mux is
port(
        x0, x1 : in std_logic_vector(15 downto 0);
        y0 : out std_logic_vector(15 downto 0);
        c : in std_logic
);
end hexbit2u1mux;

architecture Behavioral of hexbit2u1mux is

begin

y0 <= x1 when c = '1' else
                x0;

end Behavioral;

