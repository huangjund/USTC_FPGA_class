library ieee;
use ieee.std_logic_1164.all;

entity scanner is
port(counter_input : in std_logic_vector(0 to 1);
		scan_output : out std_logic_vector(0 to 3));
end entity scanner;

architecture behave of scanner is
begin
	process(counter_input)
		begin
		case counter_input is
			when "00" => scan_output <= "1110";
			when "01" => scan_output <= "1101";
			when "10" => scan_output <= "1011";
			when "11" => scan_output <= "0111";
			when others => NULL;
		end case;
	end process;
end behave;