library ieee;
use ieee.std_logic_1164.all;

entity latcher is
	port(Data : in std_logic_vector(0 to 3);
			sc : in std_logic_vector(0 to 2);
			latch : in std_logic;
			scan : in std_logic_vector(0 to 2);
			data_out: out std_logic_vector(0 to 3));
end entity latcher;

architecture behave of latcher is

type lch_array is array(0 to 7) of std_logic_vector(0 to 3);
signal lch : lch_array;
signal temp: std_logic := '1';

begin

--	process(sc,latch,Data)
--	begin
--		if (latch = '1') then
--			case sc is 
--				when "000" => lch(0) <= Data;
--				when "001" => lch(1) <= Data;
--				when "010" => lch(2) <= Data;
--				when "011" => lch(3) <= Data;
--				when "100" => lch(4) <= Data;
--				when "101" => lch(5) <= Data;
--				when "110" => lch(6) <= Data;
--				when "111" => lch(7) <= Data;
--			end case;
--		end if;
--	end process;

		lch(0) <= Data when (latch = '1' and sc = "000");
		lch(1) <= Data when (latch = '1' and sc = "001");
		lch(2) <= Data when (latch = '1' and sc = "010");
		lch(3) <= Data when (latch = '1' and sc = "011");
		lch(4) <= Data when (latch = '1' and sc = "100");
		lch(5) <= Data when (latch = '1' and sc = "101");
		lch(6) <= Data when (latch = '1' and sc = "110");
		lch(7) <= Data when (latch = '1' and sc = "111");
	
	
	process(scan)
	begin
		case scan is
			when "000" => data_out <= lch(0);
			when "001" => data_out <= lch(1);
			when "010" => data_out <= lch(2);
			when "011" => data_out <= lch(3);
			when "100" => data_out <= lch(4);
			when "101" => data_out <= lch(5);
			when "110" => data_out <= lch(6);
			when "111" => data_out <= lch(7);
			when others => data_out <= "XXXX";
		end case;
	end process;
	
end behave;