library ieee;
use ieee.std_logic_1164.all;

entity print is
port(decode_input : in std_logic_vector(0 to 3);
		sc : out std_logic_vector(0 to 7);
		print_out : out std_logic_vector(0 to 6);
		detect_none : in std_logic);
end entity print;

architecture behave of print is
begin
	sc <= "01000000";
	process(decode_input,detect_none)
	variable a0:std_logic_vector(0 to 6) := "0000001";
	variable a1:std_logic_vector(0 to 6) := "1001111";
	variable a2:std_logic_vector(0 to 6) := "0010010";
	variable a3:std_logic_vector(0 to 6) := "0000110";
	variable a4:std_logic_vector(0 to 6) := "1001100";
	variable a5:std_logic_vector(0 to 6) := "0100100";
	variable a6:std_logic_vector(0 to 6) := "0100000";
	variable a7:std_logic_vector(0 to 6) := "0001111";
	variable a8:std_logic_vector(0 to 6) := "0000000";
	variable a9:std_logic_vector(0 to 6) := "0000100";
	variable aA:std_logic_vector(0 to 6) := "0001000";
	variable aB:std_logic_vector(0 to 6) := "1100000";
	variable aC:std_logic_vector(0 to 6) := "0110001";
	variable aD:std_logic_vector(0 to 6) := "1000010";
	variable aE:std_logic_vector(0 to 6) := "0110000";
	variable aF:std_logic_vector(0 to 6) := "0111000";
	begin
		if(detect_none = '1') then
			print_out <= "1111111";
		else
			case decode_input is
				when "0000" => print_out <= a0;
				when "0001" => print_out <= a1;
				when "0010" => print_out <= a2;
				when "0011" => print_out <= a3;
				when "0100" => print_out <= a4;
				when "0101" => print_out <= a5;
				when "0110" => print_out <= a6;
				when "0111" => print_out <= a7;
				when "1000" => print_out <= a8;
				when "1001" => print_out <= a9;
				when "1010" => print_out <= aA;
				when "1011" => print_out <= aB;
				when "1100" => print_out <= aC;
				when "1101" => print_out <= aD;
				when "1110" => print_out <= aE;
				when "1111" => print_out <= aF;
				when others => print_out <= "1111111";
			end case;
		end if;
	end process;
end behave;