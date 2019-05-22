library ieee;
use ieee.std_logic_1164.all;

entity Screen is
port(clk : in std_logic;
		Scanner_out : out std_logic_vector(0 to 3);
		Row_input : in std_logic_vector(0 to 3);
		LCDEN : out std_logic;  -- H enable 
		LCDRW : out std_logic;-- H - Read  L - Write
		LCDRS : out std_logic;-- L - Instruction  H - Data 
		LCDPSB: out std_logic;-- L-Series H - Parallel
		LCDRST: out std_logic;-- Low enable
		rst	: in std_logic;
		LCDData	 : out std_logic_vector(7 downto 0));
end entity Screen;

architecture behavior of Screen is
component Keyboard is
port(clk : in std_logic;
		scanner_out : out std_logic_vector(0 to 3);
		Row_input : in std_logic_vector(0 to 3);
		code_bus : out std_logic_vector(0 to 3);
		detect_none : out std_logic);
end component;

component sreendriver is
port(	LCDEN : out std_logic;  -- H enable 
		LCDRW : out std_logic;-- H - Read  L - Write
		LCDRS : out std_logic;-- L - Instruction  H - Data 
		LCDPSB: out std_logic;-- L-Series H - Parallel
		LCDRST: out std_logic;-- Low enable
		rst	: in std_logic;
		LCDData	 : out std_logic_vector(7 downto 0);
		inCode :in std_logic_vector(0 to 3);
		DetectNone : in std_logic;
		clk : in std_logic);
end component;

signal code_bus : std_logic_vector(0 to 3);
signal detect_none : std_logic;

begin
Keyboard1 : Keyboard port map(clk,Scanner_out,Row_input,code_bus,detect_none);
Screen1 : sreendriver port map(LCDEN,LCDRW,LCDRS,LCDPSB,LCDRST,rst,LCDData,code_bus,detect_none,clk);
end behavior;