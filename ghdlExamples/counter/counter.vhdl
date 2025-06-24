LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY counter IS
  PORT (
    clk : IN STD_LOGIC;
    O : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END counter;

ARCHITECTURE behaviour OF counter IS
  SIGNAL count : unsigned(3 DOWNTO 0) := (OTHERS => '0');
BEGIN
  -- PROCESS (clk, count)
  -- BEGIN
    IF (rising_edge(clk)) THEN
      count <= count + 1;
    END IF;
  -- END PROCESS;
  O <= STD_LOGIC_VECTOR(count);
END behaviour;