----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:26 12/05/2020 
-- Design Name: 
-- Module Name:    PushButton - Behavioral 
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

entity PushButton is port (
	KClk : in STD_LOGIC;
	KeyIn : in STD_LOGIC;
	Status : out STD_LOGIC);
end PushButton;

architecture Behavioral of PushButton is
	signal ShiftRegister : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal KeyFlag : STD_LOGIC;
	signal SetFlag : STD_LOGIC;
	signal ClrFlag : STD_LOGIC;
begin
	ShiftInstance : process(KClk)
	begin
		if falling_edge(KClk) then
			ShiftRegister <= ShiftRegister (2 DOWNTO 0) & KeyIn;
		end if;
	end process;
	
	SetFlag <= '1' when (ShiftRegister = "0000") else '0';
	ClrFlag <= '1' when (ShiftRegister = "1111") else '0';
	
	FlsgInstane : process (ClrFlag, SetFlag)
	begin
		if ClrFlag = '1' then
			KeyFlag <= '0';
		else
			if SetFlag = '1' then
				KeyFlag <= '1';
			end if;
		end if;
	end process;
	
	Status <= KeyFlag;
end Behavioral;

