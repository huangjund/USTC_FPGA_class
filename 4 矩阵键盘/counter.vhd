library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
port(fclk : in std_logic;
		counter_output : out std_logic_vector(0 to 1));
end entity counter;

architecture behave of counter is

begin
	process(fclk)
	variable temp : std_logic_vector(0 to 1) := "00";
	begin
		if (rising_edge(fclk)) then
			temp := temp + 1;
		end if;
		counter_output <= temp;
	end process;
end behave;