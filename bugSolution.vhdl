```vhdl
ENTITY multiplier IS
  GENERIC (width : INTEGER := 8);
  PORT ( 
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    result : OUT STD_LOGIC_VECTOR(2*width-1 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE behavioral OF multiplier IS
  SIGNAL temp_result : UNSIGNED(2*width-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
  PROCESS (clk) 
  VARIABLE i : INTEGER;
  BEGIN
    IF rising_edge(clk) THEN
      temp_result <= (OTHERS => '0');
      FOR i IN 0 TO width-1 LOOP
        IF b(i) = '1' THEN
          temp_result <= temp_result + UNSIGNED(a);
        END IF;
        a <= a(width-2 DOWNTO 0) & '0'; 
      END LOOP;
      result <= STD_LOGIC_VECTOR(temp_result);
    END IF;
  END PROCESS;
END ARCHITECTURE;
```