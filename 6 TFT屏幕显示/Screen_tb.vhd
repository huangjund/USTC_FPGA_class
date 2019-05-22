library ieee;
use ieee.std_logic_1164.all;

entity Screen_tb is
end Screen_tb;

architecture be of Screen_tb is

component Screen is
port(	LCDEN : out std_logic;  -- H enable 
		LCDRW : out std_logic;-- H - Read  L - Write
		LCDRS : out std_logic;-- L - Instruction  H - Data 
		LCDPSB: out std_logic;-- L-Series H - Parallel
		LCDRST: out std_logic;-- Low enable
		rst	: in std_logic;
		LCDData	 : out std_logic_vector(7 downto 0);
		clk : in std_logic);
end component;

signal LCDEN:std_logic;
signal LCDRW:std_logic;
signal LCDRS:std_logic;
signal LCDPSB:std_logic;
signal LCDRST:std_logic;
signal rst : std_logic;
signal LCDData : std_logic_vector(7 downto 0);
signal clk :std_logic;

begin
s : Screen port map(LCDEN,LCDRW,LCDRS,LCDPSB,LCDRST,rst,LCDData,clk);
	process
	begin
		rst <= '1';
		
		clk <= '1';
		wait for 2 ns;
		clk <= '0';
		wait for 2 ns;
	end process;
end be;