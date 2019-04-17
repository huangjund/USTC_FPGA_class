library ieee;
use ieee.std_logic_1164.all;

entity reader is
port(fclk : in std_logic;
		Row_input : in std_logic_vector(0 to 3);
		Row_info : out std_logic_vector(0 to 3));
end entity reader;

architecture behave of reader is
begin
	process(fclk)
	begin
		if rising_edge(fclk) then
			Row_info <= Row_input;
		end if;
	end process;
end behave;