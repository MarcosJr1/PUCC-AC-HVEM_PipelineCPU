LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PIPELINEREGIDEX IS
	PORT (
		-- Portas de entrada
		CLOCK : IN STD_LOGIC;
		-- POSITION: (PCSrc, MEMtoREG)
		IDEX_IN_WB : IN STD_LOGIC_VECTOR(0 TO 1);
		-- POSITION: (BRANCH, MENRead, MEMWrite)
		IDEX_IN_MEM : IN STD_LOGIC_VECTOR(0 TO 2);
		-- POSITION: (REGDst, ALUOp, ALUSrc)
		IDEX_IN_EX : IN STD_LOGIC_VECTOR(0 TO 4);
		-- PC+4
		IDEX_IN_PC : IN STD_LOGIC_VECTOR(0 TO 31);
		-- READ
		IDEX_IN_READ1 : IN STD_LOGIC_VECTOR(0 TO 31);
		IDEX_IN_READ2 : IN STD_LOGIC_VECTOR(0 TO 31);
		--IMMEDIATE
		IDEX_IN_IMED : IN STD_LOGIC_VECTOR(0 TO 31);
		--- NUMBER OF REGISTER
		IDEX_IN_RT : IN STD_LOGIC_VECTOR(0 TO 4);
		--  NUMBER OF REGISTER-
		IDEX_IN_RD : IN STD_LOGIC_VECTOR(0 TO 4);

		-- Portas de saída
		IDEX_OUT_WB : OUT STD_LOGIC_VECTOR(0 TO 1) := "00";
		IDEX_OUT_MEM : OUT STD_LOGIC_VECTOR(0 TO 2) := "000";
		IDEX_OUT_EX : OUT STD_LOGIC_VECTOR(0 TO 4) := "00000";
		IDEX_OUT_PC : OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		IDEX_OUT_READ1 : OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		IDEX_OUT_READ2 : OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		IDEX_OUT_IMED : OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		IDEX_OUT_RT : OUT STD_LOGIC_VECTOR(0 TO 4) := "00000";
		IDEX_OUT_RD : OUT STD_LOGIC_VECTOR(0 TO 4) := "00000");
END PIPELINEREGIDEX;

ARCHITECTURE A OF PIPELINEREGIDEX IS

BEGIN
	PROCESS (CLOCK)
	BEGIN
		IF (CLOCK'EVENT AND CLOCK = '1') THEN
			IDEX_OUT_WB <= IDEX_IN_WB;
			IDEX_OUT_MEM <= IDEX_IN_MEM;
			IDEX_OUT_EX <= IDEX_IN_EX;
			IDEX_OUT_PC <= IDEX_IN_PC;
			IDEX_OUT_READ1 <= IDEX_IN_READ1;
			IDEX_OUT_READ2 <= IDEX_IN_READ2;
			IDEX_OUT_IMED <= IDEX_IN_IMED;
			IDEX_OUT_RT <= IDEX_IN_RT;
			IDEX_OUT_RD <= IDEX_IN_RD;
		END IF;
	END PROCESS;
END;