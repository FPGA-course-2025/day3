LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY sm1_tb IS
END sm1_tb;

ARCHITECTURE behaviour OF sm1_tb IS
  --  Declaration of the component that will be instantiated.
  COMPONENT sm1
    PORT (Clk : IN STD_LOGIC;
          Rst : IN STD_LOGIC;
          Sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          Dout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
  END COMPONENT;

  COMPONENT heartbeat
    PORT (clk : OUT STD_LOGIC);
  END COMPONENT;

  --  Specifies which entity is bound with the component.
  FOR sm1_0 : sm1 USE ENTITY work.sm1;
  FOR heartbeat_0 : heartbeat USE ENTITY work.heartbeat;

  SIGNAL clk : STD_LOGIC;
  SIGNAL Rst : STD_LOGIC := '0';
  SIGNAL Sel : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"; 
  SIGNAL Dout : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
  --  Component instantiation.
  sm1_0 : sm1 PORT MAP(clk => clk, Rst => Rst, Sel => Sel, Dout => Dout);
  heartbeat_0 : heartbeat PORT MAP(clk => clk);

  --  This process does the real job.
  PROCESS
    BEGIN
    wait for 100 ns;
      Sel <= "1111";  -- Select state S1
    WAIT for 1000 ns;
      Sel <= "1100";  -- Select state S2
    WAIT for 1000 ns;
      Sel <= "1000";  -- Select state S3
  Wait;
  END PROCESS;

END ARCHITECTURE behaviour;
