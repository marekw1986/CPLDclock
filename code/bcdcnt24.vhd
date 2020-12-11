----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:51:52 12/11/2020 
-- Design Name: 
-- Module Name:    bcdcnt24 - Behavioral 
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

entity bcdcnt24 is
	port (
		clkin : in STD_LOGIC;
		rst : in STD_LOGIC;
		clkout : out STD_LOGIC;
		val : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end bcdcnt24;

architecture Behavioral of bcdcnt24 is

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
signal reset : STD_LOGIC;
signal rolloverrst : STD_LOGIC;
signal value : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

	cnt1 : bcdcount
		generic map (maxval => 9)
		port map (
			clkin => clkin,
			rst => reset,
			clkout => intclk,
			output => value(3 DOWNTO 0)
		);
		
	cnt10 : bcdcount
		generic map (maxval => 2)
		port map (
			clkin => intclk,
			rst => reset,
			clkout => clkout,
			output => value(7 DOWNTO 4)
		);	

	val <= value;
	rolloverrst <= '0' when (value = "00100100") else '1';
	reset <= rst and rolloverrst;

end Behavioral;

