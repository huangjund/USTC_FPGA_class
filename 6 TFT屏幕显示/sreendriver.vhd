library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sreendriver is
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
end entity sreendriver;

architecture behavior of sreendriver is


signal CLKControl : std_logic := '0';	--State Change Clock signal
constant CLK_CONTROL_DIV : integer range 0 to 6249 := 6249;
constant DispBuffer : std_logic_vector(79 downto 0) := X"39_37_36_35_34_33_32_31_30_29";

constant ClearAll			: std_logic_vector(9 downto 0) := "0000000001";
constant InitAdd			: std_logic_vector(9 downto 0) := "0000000010";
constant InitAccess		: std_logic_vector(9 downto 0) := "0000000110";
constant EnScreen			: std_logic_vector(9 downto 0) := "0000001100";
constant DisScreen		: std_logic_vector(9 downto 0) := "0000001000";
constant REfr0to1			: std_logic_vector(9 downto 0) := "0000110100";
constant ReadBF			: std_logic_vector(9 downto 0) := "0100000000"; --BF在第三位，后六位为AC

constant GDRAMInit		: std_logic_vector(9 downto 0) := "0010000000";
constant REfr1to0			: std_logic_vector(9 downto 0) := "0000110000";
constant onSketch			: std_logic_vector(9 downto 0) := "0000110110";
constant offSketch		: std_logic_vector(9 downto 0) := "0000110100";
constant off10				: std_logic_vector(9 downto 0) := "0000110000";	--关闭绘图的同时切换指令集到0
constant on10				: std_logic_vector(9 downto 0) := "0000110010";	--打开绘图的同时切换指令集到0
type state is (
allinit,sketch
);

signal Current_State:state:=allinit;
signal dBuffer : std_logic_vector(7 downto 0):=X"40";

begin
	LCDRW <= '0';
	LCDPSB <= '1';
	
	process(clk)--Time control : 6250 divided
	variable Counter : integer range 0 to CLK_CONTROL_DIV;
	begin
		if(rising_edge(clk)) then
			if(Counter >= CLK_CONTROL_DIV) then
				CLKControl <= not CLKControl;
				Counter := 0;
			else
				Counter := Counter + 1;
			end if;
		end if;
	end process;
	
	process(inCode,DetectNone)
	
	begin
		if(DetectNone = '0') then
			case inCode is
				when X"0" => dBuffer <= X"31";
				when X"1" => dBuffer <= X"32";
				when X"2" => dBuffer <= X"33";
				when X"3" => dBuffer <= X"41";
				when X"4" => dBuffer <= X"34";
				when X"5" => dBuffer <= X"35";
				when X"6" => dBuffer <= X"36";
				when X"7" => dBuffer <= X"42";
				when X"8" => dBuffer <= X"37";
				when X"9" => dBuffer <= X"38";
				when X"a" => dBuffer <= X"39";
				when X"b" => dBuffer <= X"43";
				when X"c" => dBuffer <= X"0F";
				when X"d" => dBuffer <= X"30";
				when X"e" => dBuffer <= X"23";
				when X"f" => dBuffer <= X"44";
				when others => dBuffer <= X"02";
			end case;
		end if;
	end process;
	
	process(rst,CLKControl)
	variable State :integer range 0 to 63 := 0;
	variable GDState :integer range 0 to 31 := 0;
	variable Pointer :integer range 0 to 10 := 0;
		begin
			if (rst = '0') then
				 LCDRST <= '0';
				 State := 0;
				 GDState := 0;
				 Current_State <= allinit;
				 LCDRS <= 'Z';  
				 LCDData<="ZZZZZZZZ";
				 
			elsif (rising_edge(CLKControl)) then
				LCDRST <= '1';
				
				case Current_State is
				
					when allinit =>	--init
						
						case State is
							--Reset
							when 0 => LCDRST <= '1';State := State + 1;
							when 1 => LCDRST <= '0';State := State + 1;
							when 2 => LCDRST <= '1';State := State + 1;
							--Send Command REfr1to0 ~ 0x30 
							when 3 => LCDEN <= '0';LCDRS <= '0'; State := State + 1;
							when 4 => LCDData <= REfr1to0(7 downto 0); State := State + 1;
							when 5 => LCDEN <= '1';State := State + 1;
							when 6 => LCDEN <= '0';State := State + 1;
							--Send Command DisScreen ~ 0x08 
							when 7 => LCDEN <= '0';LCDRS <= '0'; State := State + 1;
							when 8 => LCDData <= DisScreen(7 downto 0); State := State + 1;
							when 9 => LCDEN <= '1';State := State + 1;
							when 10 => LCDEN <= '0';State := State + 1;
							--Send Command ClearAll ~ 0x01
							when 11 => LCDEN <= '0';LCDRS <= '0'; State := State + 1;
							when 12 => LCDData <= InitAccess(7 downto 0); State := State + 1;
							when 13 => LCDEN <= '1';State := State + 1;
							when 14 => LCDEN <= '0';State := State + 1;
							--Send Command InitAccess ~ 0x06
							when 15 => LCDEN <= '0';LCDRS <= '0'; State := State + 1;
							when 16 => LCDData <= ClearAll(7 downto 0); State := State + 1;
							when 17 => LCDEN <= '1';State := State + 1;
							when 18 => LCDEN <= '0';State := State + 1;
							--Send Command EnScreen ~ 0x0C
							when 19 => LCDEN <= '0';LCDRS <= '0'; State := State + 1;
							when 20 => LCDData <= EnScreen(7 downto 0); State := State + 1;
							when 21 => LCDEN <= '1';State := State + 1;
							when 22 => LCDEN <= '0';State := 0;Current_State <= sketch;
							
							when others => State := 0;
						end case;

					when sketch =>
						
						case GDState is
							--Send Command GDRAMInit ~ 0x80
							when 0 => LCDEN <= '0'; LCDRS <= '0'; GDState := GDState + 1;
							when 1 => LCDData <= GDRAMInit(7 downto 0); GDState := GDState + 1;
							when 2 => LCDEN <= '1'; GDState := GDState + 1;
							when 3 => LCDEN <= '0'; GDState := GDState + 1;
							--Print
							
							when 4 =>
								if(Pointer = 1) then
									Pointer := 0;GDState := 0;
								else
									GDState:=5;end if; 
							
							when 5 => LCDEN <= '0'; LCDRS <= '1'; GDState := GDState + 1;
							when 6 => LCDData <= dBuffer(Pointer*8 + 7 downto Pointer*8); GDState := GDState + 1;
							when 7 => LCDEN <= '1'; GDState := GDState + 1;
							when 8 => LCDEN <= '0'; GDState := GDState + 1;
							when 9 => Pointer := Pointer + 1; GDState := 4;
							when others => GDState := 0;
						end case;
					when others => Current_State <= allinit;
				end case;
			end if;
	end process;

end behavior;