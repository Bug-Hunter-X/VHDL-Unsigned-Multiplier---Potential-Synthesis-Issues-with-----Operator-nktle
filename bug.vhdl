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
BEGIN
  PROCESS (clk) 
  BEGIN
    IF rising_edge(clk) THEN
      result <= a * b;
    END IF;
  END PROCESS;
END ARCHITECTURE;
```