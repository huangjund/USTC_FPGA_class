LIBRARY IEEE;
use ieee.std_logic_1164.all;

entity selector is 
	port(input,SC : IN std_logic;
			output : OUT std_logic);
END entity selector;

architecture behav of selector is 
begin
	
	process(SC,input)
	begin
		if (SC = '1') then output <= input;
		elsif(SC = '0') then output <= '0';
		end if;
	end process;
end behav;