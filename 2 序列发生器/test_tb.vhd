LIBRARY IEEE;
use ieee.std_logic_1164.all;
--
ENTITY test_tb IS 
END ENTITY test_tb;

ARCHITECTURE shell of test_tb IS 
component testx is
	port(clk, reset, sc : in std_logic;
			output : out std_logic);
end component;

signal reset, sc ,clk:std_logic;
signal output:std_logic;

begin
	full :testx port map (clk, reset,sc,output);
	process
		begin
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
	end process;
	
	process(clk)
		begin
		sc <= '1';
--		input <= '1';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
--		input <= '0';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
--		input <= '0';
--		wait for 10 ns;
--		input <= '0';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
--		input <= '1';
--		wait for 10 ns;
	end process;
END shell;

