LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ram_tb IS
END ram_tb;

ARCHITECTURE behaviour OF ram_tb IS
  --  Declaration of the component that will be instantiated.
  COMPONENT ram
    PORT ( clk : IN STD_LOGIC;
          a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
          di : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          we : IN STD_LOGIC;
          do : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
  END COMPONENT;

  COMPONENT heartbeat
    PORT (clk : OUT STD_LOGIC);
  END COMPONENT;

  --  Specifies which entity is bound with the component.
  FOR ram_0 : ram USE ENTITY work.ram;
  FOR heartbeat_0 : heartbeat USE ENTITY work.heartbeat;

  SIGNAL clk : STD_LOGIC;
  SIGNAL a : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL di : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL we : STD_LOGIC;
  SIGNAL do : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
  --  Component instantiation.
  ram_0 : ram PORT MAP(clk => clk, a => a, di => di, we => we, do => do);
  heartbeat_0 : heartbeat PORT MAP(clk => clk);

  --  This process does the real job.
  PROCESS
    BEGIN
    wait for 100 ns;
    a <= "00000";  -- Address 0
    di <= "0001";  -- Data to write
    we <= '1';     -- Write enable
    WAIT for 100 ns;
    a <= "00001";  -- Address 0
    we <= '0';     -- Disable write
    WAIT for 100 ns;
    a <= "00000";  -- Address 0
  Wait;
  END PROCESS;

END ARCHITECTURE behaviour;