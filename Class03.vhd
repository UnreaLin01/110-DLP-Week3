ENTITY Class03 IS
	PORT(
		sw: IN BIT_VECTOR(8 downto 0);
		seg3: OUT BIT_VECTOR(6 downto 0);
		seg2: OUT BIT_VECTOR(6 downto 0);
		seg1: OUT BIT_VECTOR(6 downto 0));

END Class03;

ARCHITECTURE tripleSevenSegment OF Class03 IS
	SIGNAL nRBI: BIT_VECTOR(2 downto 0):="000";
BEGIN
	PROCESS(sw)
	BEGIN
		--100
		IF(nRBI(2) = '0' and sw(8 downto 6) = "000")THEN
			nRBI(1) <= '0';
			seg3 <= "1111111";
		ELSE
			nRBI(1) <= '1';
			CASE sw(8 downto 6) IS
				WHEN "000" =>
					seg3 <= "0000001";--0
				WHEN "001" =>
					seg3 <= "1001111";--1
				WHEN "010" =>
					seg3 <= "0010010";
				WHEN "011" =>
					seg3 <= "0000110";
				WHEN "100" =>
					seg3 <= "1001100";
				WHEN "101" =>
					seg3 <= "0100100";
				WHEN "110" =>
					seg3 <= "1100000";
				WHEN "111" =>
					seg3 <= "0001111";
				WHEN others =>
					seg3 <= "1111111";
			END CASE;
		END IF;
		
		--10
		IF(nRBI(1) = '0' and sw(5 downto 3) = "000")THEN
			nRBI(0) <= '0';
			seg2 <= "1111111";
		ELSE
			nRBI(0) <= '1';
			CASE sw(5 downto 3) IS
				WHEN "000" =>
					seg2 <= "0000001";
				WHEN "001" =>
					seg2 <= "1001111";
				WHEN "010" =>
					seg2 <= "0010010";
				WHEN "011" =>
					seg2 <= "0000110";
				WHEN "100" =>
					seg2 <= "1001100";
				WHEN "101" =>
					seg2 <= "0100100";
				WHEN "110" =>
					seg2 <= "1100000";
				WHEN "111" =>
					seg2 <= "0001111";
				WHEN others =>
					seg2 <= "1111111";
			END CASE;
		END IF;
		
		CASE sw(2 downto 0) IS
			WHEN "000" =>
				seg1 <= "0000001";
			WHEN "001" =>
				seg1 <= "1001111";
			WHEN "010" =>
				seg1 <= "0010010";
			WHEN "011" =>
				seg1 <= "0000110";
			WHEN "100" =>
				seg1 <= "1001100";
			WHEN "101" =>
				seg1 <= "0100100";
			WHEN "110" =>
				seg1 <= "1100000";
			WHEN "111" =>
				seg1 <= "0001111";
			WHEN others =>
				seg1 <= "1111111";
		END CASE;
	END PROCESS;
END tripleSevenSegment;