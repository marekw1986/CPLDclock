----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:33:30 11/18/2020 
-- Design Name: 
-- Module Name:    FDivider - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FDivider is
	port (Clk : in STD_LOGIC;
			FSec : out STD_LOGIC);
end FDivider;

architecture Behavioral of FDivider is
	signal FDivCnt : unsigned (14 downto 0);
begin
	FDividerInstance : process (Clk)
	begin
		if rising_edge(Clk) then
			FDivCnt <= FDivCnt + 1;
		end if;
	end process;
	FSec <= FDivCnt (FDivCnt'left);
end Behavioral;

