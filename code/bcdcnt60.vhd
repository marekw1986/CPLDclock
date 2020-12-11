----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:52:06 12/10/2020 
-- Design Name: 
-- Module Name:    bcdcnt60 - Behavioral 
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

entity bcdcnt60 is
	port (
		clkin : in STD_LOGIC;
		rst : in STD_LOGIC;
		clkout : out STD_LOGIC;
		val : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end bcdcnt60;

architecture Behavioral of bcdcnt60 is

component bcdcount
	generic (maxval : integer := 9);
	port (
		clkin : in STD_LOGIC;
		rst : in STD_LOGIC;
		clkout : out STD_LOGIC;
		output : out STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
end component;

signal intclk : STD_LOGIC;

begin

	cnt1 : bcdcount
		generic map (maxval => 9)
		port map (
			clkin => clkin,
			rst => rst,
			clkout => intclk,
			output => val(3 DOWNTO 0)
		);
		
	cnt10 : bcdcount
		generic map (maxval => 5)
		port map (
			clkin => intclk,
			rst => rst,
			clkout => clkout,
			output => val(7 DOWNTO 4)
		);		


end Behavioral;

