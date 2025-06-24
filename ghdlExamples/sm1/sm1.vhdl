library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sm1 is
    port(
      Clk : in std_logic;
      Rst : in std_logic;
      Sel : in std_logic_vector(3 downto 0);
      Dout   : out std_logic_vector(3 downto 0)  
    );  
end sm1;

architecture Behavioral of sm1 is

type state_t is (S0, S1, S2, S3);
signal state : state_t;
signal NextState : state_t;
constant Value0 : std_logic_vector(3 downto 0) := x"A";
constant Value1 : std_logic_vector(3 downto 0) := x"B";
constant Value2 : std_logic_vector(3 downto 0) := x"C";
constant Value3 : std_logic_vector(3 downto 0) := x"D";

begin

-- ONE process sm1

process(Clk) is
begin
   if rising_edge(Clk) then
       if Rst = '1' then
           State <= S0;
           Dout  <= Value0;
       else
         case State is
            when S0 =>   if Sel(1) = '1' then
                              State <= S1;
                              Dout <= Value1;
                           else
                              State <= S2;
                           end if;

            when S1 =>   if Sel(2) = '1' then
                              State <= S2;
                              Dout <= Value2;
                           else
                              State <= S3;
                           end if;
            when S2 =>   if Sel(3) = '1' then
                              State <= S3;
                              Dout <= Value3;
                           else
                              State <= S0;
                           end if;
            when S3 =>   if Sel(0) = '1' then
                              State <= S0;
                              Dout <= Value0;
                           else
                              State <= S1;
                           end if;

            when others =>  Dout <= Value0;
                                       State <= S0;
         end case;
      end if;
   end if;
end process;

-- END process sm1

end Behavioral;

