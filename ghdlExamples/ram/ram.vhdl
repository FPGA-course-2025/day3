LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ram IS
	PORT (
		clk : IN STD_LOGIC;
		a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		di : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		we : IN STD_LOGIC;
		do : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ram;

ARCHITECTURE Behavioral OF ram IS
	TYPE ram_type IS ARRAY (31 DOWNTO 0)
	OF STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL mem : ram_type;
	SIGNAL read_a : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
	PROCESS (clk)
	BEGIN
		IF rising_edge(Clk) THEN
			IF (we = '1') THEN
				mem(to_integer(unsigned(a))) <= di;
			END IF;
			read_a <= a;
		END IF;
	END PROCESS;
	do <= mem(to_integer(unsigned(read_a)));
END Behavioral;