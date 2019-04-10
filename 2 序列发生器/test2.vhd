library ieee;
use ieee.std_logic_1164.all;

entity test2 is
	port(input,clk: in std_logic;
--			list : out std_logic_vector(0 to 8);
			output: out std_logic);
end test2;

architecture behav of test2 is
begin

	process(input,clk)
	variable queue:std_logic_vector(0 to 8);
	variable temp:std_logic;
	begin
		if (clk'event and clk = '1') then
			temp := input;
			queue(0 to 7) := queue(1 to 8);
			queue(8):=temp;
		end if;
--		list(0 to 8) <= queue(0 to 8);
		if(queue = "111010011") then output <= '1';
		else	output <= '0';
		end if;
		
	end process;

end behav;