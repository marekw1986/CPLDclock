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
		clkin : in STD_LOGIC;
		clkout : out STD_LOGIC;
		val : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end deccount;

architecture Behavioral of deccount is

component bin2bcd
	port (
		binval : in STD_LOGIC_VECTOR(6 DOWNTO 0);
		bcdval : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;

signal counter : unsigned(6 DOWNTO 0) := (others => '0');

begin
	bcdtranslator : bin2bcd port map (
		binval => STD_LOGIC_VECTOR(counter),
		bcdval => val
	);

	count_proc : process (clkin)
	begin
		if rising_edge(clkin) then
			if counter = maxval then
				counter <= (others => '0');
				clkout <= '1';
			else
				counter <= counter + 1;
				clkout <= '0';
			end if;
		end if;
	end process;
end Behavioral;

