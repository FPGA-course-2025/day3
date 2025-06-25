LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY counter_tb IS
END counter_tb;

ARCHITECTURE behaviour OF counter_tb IS
  --  Declaration of the component that will be instantiated.
  COMPONENT counter
    PORT (
      Clk : IN STD_LOGIC;
      O : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
  END COMPONENT;

  COMPONENT heartbeat
    PORT (clk : OUT STD_LOGIC);
  END COMPONENT;

  --  Specifies which entity is bound with the component.
  FOR counter_0 : counter USE ENTITY work.counter;
  FOR heartbeat_0 : heartbeat USE ENTITY work.heartbeat;

  SIGNAL clk : STD_LOGIC;
  SIGNAL O : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL p : BIT;
BEGIN
  --  Component instantiation.
  counter_0 : counter PORT MAP(clk => clk, O => O);
  heartbeat_0 : heartbeat PORT MAP(clk => clk);

  --  This process does the real job.
  PROCESS
    TYPE pattern_type IS RECORD
      --  The expected outputs of the counter.
      O : STD_LOGIC_VECTOR(3 DOWNTO 0);
      -- p,q: bit;
    END RECORD;
    --  The patterns to apply.
    TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
    CONSTANT patterns : pattern_array := ((O => "0000"),
    (O => "0001"),
    (O => "0010"),
    (O => "0011"),
    (O => "0100"),
    (O => "0101"),
    (O => "0110"),
    (O => "0111"),
    (O => "1000"),
    (O => "1001"),
    (O => "1010"),
    (O => "1011"),
    (O => "1100"),
    (O => "1101"),
    (O => "1110"),
    (O => "1111"));
  BEGIN
    --  Check each pattern.
    FOR i IN patterns'RANGE LOOP
      --  Wait for the clock to toggle.
      WAIT UNTIL rising_edge(clk);
      --  Check the outputs.
      ASSERT O = patterns(i).O
      REPORT "bad output value" SEVERITY error;
    END LOOP;
    ASSERT false REPORT "end of test" SEVERITY note;
    --  Wait forever; this will finish the simulation.
    WAIT;
  END PROCESS;

END ARCHITECTURE behaviour;
