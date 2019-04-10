library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity counter is
port(clk : in std_logic;
		Par_output : out std_logic_vector(0 to 2));
end entity;

architecture behave of counter is

component divider is
	port (clk : IN std_logic;
			oclk : OUT std_logic);
end component;

signal fclk : std_logic;

begin
	div : divider port map (clk,fclk);
	
	process(fclk)
	variable count : integer range 0 to 7 := 0;
	begin
		if (fclk'event and fclk = '1') then
			if (count = 7 ) then 
				count := 0;
			else
				count := count + 1;
			end if;
			Par_output <= conv_std_logic_vector(count,3);
		end if;
	end process;
end behave;