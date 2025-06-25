
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY heartbeat_tb IS
END heartbeat_tb;

ARCHITECTURE behaviour OF heartbeat_tb IS
  --  Declaration of the component that will be instantiated.

  COMPONENT heartbeat
    PORT (clk : OUT STD_LOGIC);
  END COMPONENT;

  --  Specifies which entity is bound with the component.
  FOR heartbeat_0 : heartbeat USE ENTITY work.heartbeat;

  SIGNAL clk : STD_LOGIC;

BEGIN
  --  Component instantiation.
  heartbeat_0 : heartbeat PORT MAP(clk => clk);

  --  This process does the real job.
  PROCESS
    BEGIN

  Wait;
  END PROCESS;

END ARCHITECTURE behaviour;
