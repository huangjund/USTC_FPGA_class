library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity decoder38 is
port(code : in std_logic_vector(0 to 2);
		lan : out std_logic_vector(0 to 7));
end entity decoder38;

architecture behave of decoder38 is

begin
	process(code)
	begin
	
		for i in 0 to 7 loop
			if (code = conv_std_logic_vector(i,3)) then
				lan <= ( i => '1',others => '0');
			end if;
		end loop;
		
	end process;
end behave;