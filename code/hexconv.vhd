----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:21 11/18/2020 
-- Design Name: 
-- Module Name:    hexconv - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hexconv is port (
	A : in STD_LOGIC;
	B : in STD_LOGIC;
	C : in STD_LOGIC;
	D : in STD_LOGIC;
	Seg_A : out STD_LOGIC;
	Seg_B : out STD_LOGIC;
	Seg_C : out STD_LOGIC;
	Seg_D : out STD_LOGIC;
	Seg_E : out STD_LOGIC;
	Seg_F : out STD_LOGIC;
	Seg_G : out STD_LOGIC);
end hexconv;

architecture Behavioral of hexconv is
	signal InpTetr : STD_LOGIC_VECTOR ( 3 downto 0 );
	signal Segments : STD_LOGIC_VECTOR ( 6 downto 0 );

begin
	InpTetr <= (D, C, B, A);
	Seg_A <= Segments(0);
	Seg_B <= Segments(1);
	Seg_C <= Segments(2);
	Seg_D <= Segments(3);
	Seg_E <= Segments(4);
	Seg_F <= Segments(5);
	Seg_G <= Segments(6);
	with InpTetr select
		Segments <= "0000110" when "0001",	--1
						"1011011" when "0010",	--2
						"1001111" when "0011",	--3
						"1100110" when "0100",	--4
						"1101101" when "0101",	--5
						"1111101" when "0110",	--6
						"0000111" when "0111",	--7
						"1111111" when "1000",	--8
						"1101111" when "1001",	--9
						"1110111" when "1010",	--A
						"1111100" when "1011",	--B
						"0111001" when "1100",	--C
						"1011110" when "1101",	--D
						"1111001" when "1110",	--E
						"1110001" when "1111",	--F
						"0111111" when others;	--0

end Behavioral;

