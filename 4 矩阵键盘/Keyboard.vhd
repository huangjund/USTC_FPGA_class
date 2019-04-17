library ieee;
use ieee.std_logic_1164.all;

entity Keyboard is
port(clk : in std_logic;
		scanner_out : out std_logic_vector(0 to 3);
		Row_input : in std_logic_vector(0 to 3);
		Digital_sc : out std_logic_vector(0 to 7);
		Digital_output : out std_logic_vector(0 to 6));
end entity Keyboard;

architecture behave of Keyboard is

component divider is
port(clk : in std_logic;
		fclk : out std_logic);
end component divider;

component counter is
port(fclk : in std_logic;
		counter_output : out std_logic_vector(0 to 1));
end component counter;

component scanner is
port(counter_input : in std_logic_vector(0 to 1);
		scan_output : out std_logic_vector(0 to 3));
end component scanner;

component reader is
port(fclk : in std_logic;
		Row_input : in std_logic_vector(0 to 3);
		Row_info : out std_logic_vector(0 to 3));
end component reader;

component decoder is
port(counter_input : in std_logic_vector(0 to 1);
		Row_info : in std_logic_vector(0 to 3);
		decode_output: out std_logic_vector(0 to 3);
		detect_none : out std_logic);
end component decoder;

component print is
port(decode_input : in std_logic_vector(0 to 3);
		sc : out std_logic_vector(0 to 7);
		print_out : out std_logic_vector(0 to 6);
		detect_none : in std_logic);
end component print;

signal counter_bus : std_logic_vector(0 to 1);
signal Row_info_bus : std_logic_vector(0 to 3);
signal code_bus : std_logic_vector(0 to 3);
signal detect_none : std_logic;
signal fclk : std_logic;


begin
divider1 : divider port map(clk, fclk);
counter1 : counter port map(fclk , counter_bus);
scanner1 : scanner port map(counter_bus, scanner_out);
reader1 : reader port map(fclk, Row_input, Row_info_bus);
decoder1 : decoder port map(counter_bus, Row_info_bus, code_bus, detect_none);
print1 : print port map(code_bus, Digital_sc, Digital_output, detect_none);

end behave;