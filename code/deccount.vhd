----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:16 12/04/2020 
-- Design Name: 
-- Module Name:    deccount - Behavioral 
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

entity deccount is
	generic (maxval : integer := 99);
	port (
		clk : in STD_LOGIC;
		val : out STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
end deccount;

architecture Behavioral of deccount is

signal counter : unsigned(6 DOWNTO 0) := (others => '0');

begin
	count_proc : process (clk)
	begin
		if rising_edge(clk) then
			if counter = maxval then
				counter <= (others => '0');
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
end Behavioral;

