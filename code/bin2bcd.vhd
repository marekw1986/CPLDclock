----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:26:27 12/05/2020 
-- Design Name: 
-- Module Name:    bin2bcd - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bin2bcd is port (
	binval : in STD_LOGIC_VECTOR(6 DOWNTO 0);
	bcdval : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end bin2bcd;

architecture Behavioral of bin2bcd is

begin
	process (binval)
		variable binx : std_logic_vector (6 DOWNTO 0) ;
		variable bcd  : std_logic_vector (7 DOWNTO 0) ;
	begin
		bcd := (others => '0');
		binx := binval(6 DOWNTO 0);
		 for i in binx'range loop
		  if bcd(3 downto 0) > "0100" then
			 bcd(3 downto 0) := std_logic_vector(unsigned( bcd(3 downto 0)) + "0011"); 
		  end if ;
		  if bcd(7 downto 4) > "0100" then
			  bcd(7 downto 4) := std_logic_vector(unsigned( bcd(7 downto 4)) + "0011");    
		  end if ;
		  bcd := bcd(6 downto 0) & binx(6) ; 
		  binx := binx(5 downto 0) & '0' ; 
		 end loop ;
		bcdval <= bcd;
	end process;
end Behavioral;

