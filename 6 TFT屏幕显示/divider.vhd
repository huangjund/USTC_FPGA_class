library ieee;
use ieee.std_logic_1164.all;

entity divider is
port(clk : in std_logic;
		fclk : out std_logic);
end entity divider;

architecture behave of divider is

begin
	process(clk)
	variable temp : integer range 0 to 100 := 0;
	variable sign : std_logic :='0';
	begin
		if (rising_edge(clk)) then
			temp := temp + 1;
			if(temp = 100) then
				temp := 0;
				fclk <= sign;
				sign := not sign;
			end if;
		end if;
	end process;
end behave;