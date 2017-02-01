# 80085

Prepravljene adrese registara u 4-bitne:


when "0000" => a_bus <= pc;
when "0001" => a_bus <= ac;
when "0010" => a_bus <= sp;
when "0011" => a_bus <= ir;
when "0100" => a_bus <= tir;
when "0101" => a_bus <= zero;
when "0110" => a_bus <= p_one;
when "0111" => a_bus <= n_one;
when "1000" => a_bus <= amask;
when "1001" => a_bus <= smask;
when "1010" => a_bus <= a;
when "1011" => a_bus <= b;
when "1100" => a_bus <= c;
when "1101" => a_bus <= d;
when "1110" => a_bus <= e;
when "1111" => a_bus <= f;
when others => null;
end case;
case b_adr is
when "0000" => b_bus <= pc;
when "0001" => b_bus <= ac;
when "0010" => b_bus <= sp;
when "0011" => b_bus <= ir;
when "0100" => b_bus <= tir;
when "0101" => b_bus <= zero;
when "0110" => b_bus <= p_one;
when "0111" => b_bus <= n_one;
when "1000" => b_bus <= amask;
when "1001" => b_bus <= smask;
when "1010" => b_bus <= a;
when "1011" => b_bus <= b;
when "1100" => b_bus <= c;
when "1101" => b_bus <= d;
when "1110" => b_bus <= e;
when "1111" => b_bus <= f;
when others => b_bus <= "ZZZZZZZZZZZZZZZZ";
end case;
-- sa sabirnice u registar
case c_adr is
when "0000" => pc <= c_bus;
when "0001" => ac <= c_bus;
when "0010" => sp <= c_bus;
when "0011" => ir <= c_bus;
when "0100" => tir <= c_bus;
when "0101" => zero <= zero;
when "0110" => p_one <= p_one;
when "0111" => n_one <= n_one;
when "1000" => amask <= c_bus;
when "1001" => smask <= c_bus;
when "1010" => a <= c_bus;
when "1011" => b <= c_bus;
when "1100" => c <= c_bus;
when "1101" => d <= c_bus;
when "1110" => e <= c_bus;
when "1111" => f <= c_bus;
when others => null;
end case;