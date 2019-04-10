library ieee;
use ieee.std_logic_1164.all;

entity divider is
	port (clk : IN std_logic;
			oclk : OUT std_logic);
end entity;

architecture behave of divider is
begin
	process(clk)
		variable num: integer range 0 to 31;
		variable temp:std_logic := '1';
		begin
		if (clk = '1' and clk'event) then
			if (num = 10) then 
				num := 0; temp := not temp; oclk <= temp; 
			else	num := num + 1;
			end if;
		end if;
		
	end process;
end behave;