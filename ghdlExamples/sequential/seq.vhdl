library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority is
port (a: in std_logic_vector(3 downto 0);
y: out std_logic_vector(1 downto 0);
valid: out std_logic);
end entity priority;
architecture Concurrent of priority is
begin
y <= "11" when a(3) = '1' else
"10" when a(2) = '1' else
"01" when a(1) = '1' else
"00" when a(0) = '1' else
"00";
valid <= '1' when a(0) = '1' or a(1) = '1'
or a(2) = '1' or a(3) = '1' else
'0';
end architecture Concurrent;
architecture Sequential of
priority is
begin
process (a) is
begin
if a(3) = '1' then
y <= "11";
valid <= '1';
elsif a(2) = '1' then
y <= "10";
valid <= '1';
elsif a(1) = '1' then
y <= "01";
valid <= '1';
elsif a(0) = '1' then
y <= "00";
valid <= '1';
else
y <= "00";
valid <= '0';
end if;
end process;
end architecture Sequential;

architecture Sequential2 of
priority is
begin
process (a) is
begin
valid <= '1';
if a(3) = '1' then
y <= "11";
elsif a(2) = '1' then
y <= "10";
elsif a(1) = '1' then
y <= "01";
elsif a(0) = '1' then
y <= "00";
else
valid <= '0';
y <= "00";
end if;
end process;
end architecture Sequential2;

-- This is a testbench for the priority encoder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_priority is
end entity tb_priority;
architecture test of tb_priority is
  signal a: std_logic_vector(3 downto 0);
  signal y: std_logic_vector(1 downto 0);
  signal valid: std_logic;
begin
  uut: entity work.priority(Concurrent)
    port map (a => a, y => y, valid => valid);

  process
  begin
    a <= "0000"; wait for 10 ns;
    a <= "0001"; wait for 10 ns;
    a <= "0010"; wait for 10 ns;
    a <= "0100"; wait for 10 ns;
    a <= "1000"; wait for 10 ns;
    a <= "1111"; wait for 10 ns;
    a <= "0000"; wait for 10 ns;
    wait; -- Wait indefinitely
  end process;
end architecture test;