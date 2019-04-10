library ieee;
use ieee.std_logic_1164.all;

entity digital is --47
port(Data : in std_logic_vector(0 to 3);
		sc : in std_logic_vector(0 to 2);
		latch : in std_logic;
		output: out std_logic_vector(0 to 6);
		clk : in std_logic;
		select1 : out std_logic_vector(0 to 7));
		
end entity;

architecture behave of digital is

component counter is
port(clk : in std_logic;
		Par_output : out std_logic_vector(0 to 2));
end component;

component latcher is
	port(Data : in std_logic_vector(0 to 3);
			sc : in std_logic_vector(0 to 2);
			latch : in std_logic;
			scan : in std_logic_vector(0 to 2);
			data_out: out std_logic_vector(0 to 3));
end component;

component decoder38 is
port(code : in std_logic_vector(0 to 2);
		lan : out std_logic_vector(0 to 7));
end component;

signal data_output : std_logic_vector(0 to 3);
signal temp_bus : std_logic_vector(0 to 2);

begin
	counter3: counter port map(clk,temp_bus);
	latch48 : latcher port map (Data,sc,latch,temp_bus,data_output);
	dec : decoder38 port map(temp_bus,select1);
	
	process(data_output)
	variable a0:std_logic_vector(0 to 6) := "0000001";
	variable a1:std_logic_vector(0 to 6) := "1001111";
	variable a2:std_logic_vector(0 to 6) := "0010010";
	variable a3:std_logic_vector(0 to 6) := "0000110";
	variable a4:std_logic_vector(0 to 6) := "1001100";
	variable a5:std_logic_vector(0 to 6) := "0100100";
	variable a6:std_logic_vector(0 to 6) := "0100000";
	variable a7:std_logic_vector(0 to 6) := "0001111";
	variable a8:std_logic_vector(0 to 6) := "0000000";
	variable a9:std_logic_vector(0 to 6) := "0000100";
	variable aA:std_logic_vector(0 to 6) := "0001000";
	variable aB:std_logic_vector(0 to 6) := "1100000";
	variable aC:std_logic_vector(0 to 6) := "0110001";
	variable aD:std_logic_vector(0 to 6) := "1000010";
	variable aE:std_logic_vector(0 to 6) := "0110000";
	variable aF:std_logic_vector(0 to 6) := "0111000";
	
	begin
	case data_output is
		when "0000" => output <= a0;
		when "0001" => output <= a1;
		when "0010" => output <= a2;
		when "0011" => output <= a3;
		when "0100" => output <= a4;
		when "0101" => output <= a5;
		when "0110" => output <= a6;
		when "0111" => output <= a7;
		when "1000" => output <= a8;
		when "1001" => output <= a9;
		when "1010" => output <= aA;
		when "1011" => output <= aB;
		when "1100" => output <= aC;
		when "1101" => output <= aD;
		when "1110" => output <= aE;
		when "1111" => output <= aF;
		when others => output <= "XXXXXXX";
	end case;
	end process;
end behave;