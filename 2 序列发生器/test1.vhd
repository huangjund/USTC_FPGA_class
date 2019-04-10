LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY test1 IS
	port(clk,reset : IN std_logic;
			seriaout : OUT std_logic);
END ENTITY test1;

ARCHITECTURE behav OF test1 IS

TYPE TIMESERIA IS (s0,s1,s2,s3,s4,s5,s6,s7,s8);
SIGNAL current_state :TIMESERIA;

BEGIN
	
	clk_rise: PROCESS(clk,reset)
	BEGIN
		if (reset = '1') THEN current_state <= s0 ;
		ELSif (clk'EVENT AND clk = '1') THEN
			CASE current_state IS
				WHEN s0 => current_state <= s1;
				WHEN s1 => current_state <= s2;
				WHEN s2 => current_state <= s3;
				WHEN s3 => current_state <= s4;
				WHEN s4 => current_state <= s5;
				WHEN s5 => current_state <= s6;
				WHEN s6 => current_state <= s7;
				WHEN s7 => current_state <= s8;
				WHEN s8 => current_state <= s0;
				when others => null;
			END CASE;
		END IF;
	END PROCESS clk_rise;
	
	
	print: PROCESS(current_state)
	BEGIN
		CASE current_state IS
			WHEN s0 => seriaout <= '1';
			WHEN s1 => seriaout <= '1';
			WHEN s2 => seriaout <= '1';
			WHEN s3 => seriaout <= '0';
			WHEN s4 => seriaout <= '1';
			WHEN s5 => seriaout <= '0';
			WHEN s6 => seriaout <= '0';
			WHEN s7 => seriaout <= '1';
			WHEN s8 => seriaout <= '1';
			when others => null;
		END CASE;
	END PROCESS print;
	
	
END behav;