library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity decoder is
port(counter_input : in std_logic_vector(0 to 1);
		Row_info : in std_logic_vector(0 to 3);
		decode_output: out std_logic_vector(0 to 3);
		detect_none : out std_logic);
end entity decoder;

architecture behave of decoder is

begin

	process(counter_input,Row_info)
	
	begin
		if (Row_info = "1111") then
			detect_none <= '1';
		else	
			detect_none <= '0';
			if (counter_input = "00") then --10
				case Row_info is
--					when "0111" => decode_output <= conv_std_logic_vector(0,4);
--					when "1011" => decode_output <= conv_std_logic_vector(4,4);
--					when "1101" => decode_output <= conv_std_logic_vector(8,4);
--					when "1110" => decode_output <= conv_std_logic_vector(12,4);
					when "0111" => decode_output <= "0000";
					when "1011" => decode_output <= "0100";
					when "1101" => decode_output <= "1000";
					when "1110" => decode_output <= "1100";
					when others => NULL;
				end case;
			elsif (counter_input = "11") then --01
				case Row_info is
--					when "0111" => decode_output <= conv_std_logic_vector(1,4);
--					when "1011" => decode_output <= conv_std_logic_vector(5,4);
--					when "1101" => decode_output <= conv_std_logic_vector(9,4);
--					when "1110" => decode_output <= conv_std_logic_vector(13,4);
					when "0111" => decode_output <= "0001";
					when "1011" => decode_output <= "0101";
					when "1101" => decode_output <= "1001";
					when "1110" => decode_output <= "1101";
					when others => NULL;
				end case;
			elsif (counter_input = "10") then  --00
				case Row_info is
--					when "0111" => decode_output <= conv_std_logic_vector(2,4);
--					when "1011" => decode_output <= conv_std_logic_vector(6,4);
--					when "1101" => decode_output <= conv_std_logic_vector(10,4);
--					when "1110" => decode_output <= conv_std_logic_vector(14,4);
					when "0111" => decode_output <= "0010";
					when "1011" => decode_output <= "0110";
					when "1101" => decode_output <= "1010";
					when "1110" => decode_output <= "1110";
					when others => NULL;
				end case;
			elsif (counter_input = "01") then  --11
				case Row_info is
--					when "0111" => decode_output <= conv_std_logic_vector(3,4);
--					when "1011" => decode_output <= conv_std_logic_vector(7,4);
--					when "1101" => decode_output <= conv_std_logic_vector(11,4);
--					when "1110" => decode_output <= conv_std_logic_vector(15,4);
					when "0111" => decode_output <= "0011";
					when "1011" => decode_output <= "0111";
					when "1101" => decode_output <= "1011";
					when "1110" => decode_output <= "1111";
					when others => NULL;
				end case;
			end if;
		end if;
	end process;

end behave;