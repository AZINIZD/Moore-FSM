library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seq3_detect_moore is
    Port (
        x    : in  STD_LOGIC;  -- Input signal
        clk  : in  STD_LOGIC;  -- Clock signal
        y    : out STD_LOGIC   -- Output signal
    );
end seq3_detect_moore;

architecture Behavioral of seq3_detect_moore is

    type state_type is (S0, S1, S2, S3);
    signal state, next_state : state_type;

begin

    -- Sequential process for state transitions
    process(clk)
    begin
        if rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    -- Combinational process for next state logic
    process(state, x)
    begin
        case state is
            when S0 =>
                if x = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                if x = '1' then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;

            when S2 =>
                if x = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;

            when S3 =>
                if x = '1' then
                    next_state <= S3;  -- Stay in S3
                else
                    next_state <= S0;
                end if;

            when others =>
                next_state <= S0;  -- Default state
        end case;
    end process;

    -- Output logic
    y <= '1' when state = S3 else '0';

end Behavioral;