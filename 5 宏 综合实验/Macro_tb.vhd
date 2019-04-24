library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Macro_tb is
end Macro_tb;

architecture behav of Macro_tb is

component Macro is
port(reset : in std_logic;
		clk : in std_logic := '1';
		q  : out std_logic_vector(7 downto 0));
end component;

signal rst:std_logic;
signal clk:std_logic;
signal q:std_logic_vector(7 downto 0);

begin
	Xacro : Macro port map(rst,clk,q);
	
	process
		begin
		rst <= '1';
		clk <= '1';
		wait for 10ns;
		clk <= '0';
		wait for 10ns;
	end process;
end behav;