library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity digital_tb is
end entity;

architecture bh of digital_tb is

component Digital is
port(Data : in std_logic_vector(0 to 3);
		sc : in std_logic_vector(0 to 2);
		latch : in std_logic;
		output: out std_logic_vector(0 to 6);
		clk : in std_logic);
end component;

signal data : std_logic_vector(0 to 3);
signal sc : std_logic_vector(0 to 2);
signal latch : std_logic;
signal output : std_logic_vector(0 to 6);
signal clk : std_logic;

begin
	u1 : Digital port map (data,sc,latch,output,clk);
	
	process
	begin
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	end process;
	
	process
	begin
		latch <= '1';
		for i in 0 to 15 loop
		data <= CONV_STD_LOGIC_VECTOR(i,4);
			for j in 0 to 7 loop	
			sc <= conv_STD_LOGIC_VECTOR(j,3);
			wait for 10 ns;
			end loop;
		wait for 10 ns;
		end loop;
	end process;
	
end bh;