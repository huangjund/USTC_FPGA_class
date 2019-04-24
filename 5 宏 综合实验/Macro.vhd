library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Macro is
port(reset : in std_logic;
		clk : in std_logic := '1';
		q  : out std_logic_vector(7 downto 0));
end Macro;

architecture behavior of Macro is

component mystorage is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

signal address:std_LOGIC_VECTOR(9 downto 0);

begin
ROM : mystorage port map(address, clk, q);
	process(clk,reset)
	variable count : std_LOGIC_VECTOR(9 downto 0) := "0000000000";
	begin
	
		if(reset = '0') then count := "0000000000";
		elsif(rising_edge(clk)) then
			count := count + 1;
		end if;
		
		address <= count;
		
		if(count = "1111111111")then
			count := "0000000000";
		end if;
		
	end process;
	
end behavior;