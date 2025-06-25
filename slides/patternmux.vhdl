library ieee;
use ieee.std_logic_1164.all;

entity patternMux is
    port (
	sel : in std_logic;
	pattern: out std_logic_vector(3 downto 0)
    );
end entity patternMux;

architecture rtl of patternMux is
begin
	pattern <= "0101" when sel = '0' else
	           "1010" when sel = '1' else
	           "0000";  -- Default case if needed
end architecture rtl;