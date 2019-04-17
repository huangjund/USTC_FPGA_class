library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Keyboard_tb is
end entity;

architecture behavior of Keyboard_tb is

component Keyboard is
port(clk : in std_logic;
		scanner_out : out std_logic_vector(0 to 3);
		Row_input : in std_logic_vector(0 to 3);
		Digital_sc : out std_logic_vector(0 to 7);
		Digital_output : out std_logic_vector(0 to 6));
end component;

signal clk : std_logic;
signal scan : std_logic_vector(0 to 3);
signal row_input : std_logic_vector(0 to 3);
signal digital_sc : std_logic_vector(0 to 7);
signal digital_output : std_logic_vector(0 to 6);

begin
main : Keyboard port map(clk, scan, row_input,digital_sc, digital_output);

	process
	begin
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
	end process;
	
	process
	begin
		for j in 0 to 3 loop
			row_input <= (j => '0' , others => '1');
			wait for 20 ns;
			for i in 0 to 3 loop
				if (i /= j) then 
					row_input <= (others => '1');
					wait for 20 ns;
				end if;
			end loop;
		end loop;
	end process;
	
end behavior;