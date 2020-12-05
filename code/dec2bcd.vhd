----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:05 12/04/2020 
-- Design Name: 
-- Module Name:    dec2bcd - Behavioral 
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

entity dec2bcd is port (
	clk : in STD_LOGIC;
	decval : in STD_LOGIC_VECTOR(6 DOWNTO 0);
	bcdval : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end dec2bcd;

architecture Behavioral of dec2bcd is
	--signal inval : unsigned(6 DOWNTO 0) := (others => '0');
	--signal outval1 : unsigned(3 DOWNTO 0) := (others => '0');
	--signal outval10 : unsigned(3 DOWNTO 0) := (others => '0');
	
begin
	--this is temp!
	
	bcdval(6 DOWNTO 0) <= decval;
	bcdval(7) <= '0';
	
end Behavioral;

