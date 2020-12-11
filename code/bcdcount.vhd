----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:26 12/07/2020 
-- Design Name: 
-- Module Name:    bcdcount - Behavioral 
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

entity bcdcount is
	generic (maxval : integer := 9);
	port (
		clkin : in STD_LOGIC;
		rst : in STD_LOGIC;
		clkout : out STD_LOGIC;
		output : out STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
end bcdcount;

architecture Behavioral of bcdcount is
	signal counter : unsigned(3 DOWNTO 0) := (others => '0');

begin
	count_proc : process (clkin, rst)
	begin
		if rst = '0' then
			counter <= (others => '0');
		else
			if falling_edge(clkin) then
				if counter = maxval then
					counter <= (others => '0');
					clkout <= '0';
				else
					counter <= counter + 1;
					clkout <= '1';
				end if;
			end if;
		end if;
	end process;
	output <= STD_LOGIC_VECTOR(counter);
end Behavioral;

