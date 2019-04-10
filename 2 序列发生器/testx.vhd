library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testx is
	port(clk, reset, sc : in std_logic;
			output : out std_logic);
end entity;

architecture sa of testx is 
component divider
	port (clk : IN std_logic;
			oclk : OUT std_logic);
end component;

component test1
	port(clk,reset : IN std_logic;
			seriaout : OUT std_logic);
end component;

component selector
	port(input,SC : IN std_logic;
			output : OUT std_logic);
end component;

component test2
	port(input,clk: in std_logic;
			output: out std_logic);
end component;

signal fclk, a1, a2: std_logic;

begin
	dv: divider port map(clk,fclk);
	generator: test1 port map(fclk, reset, a1);
	selector1 : selector port map(a1, sc,a2);
	detector : test2 port map(a2,fclk, output);

end architecture sa;