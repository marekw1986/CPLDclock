----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:04 12/07/2020 
-- Design Name: 
-- Module Name:    dcf - Behavioral 
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

entity dcf is
	port (
		data : in STD_LOGIC
	);
end dcf;

architecture Behavioral of dcf is
	signal buff : STD_LOGIC_VECTOR(59 DOWNTO 0) := (others => '0');

begin
	dcf_proc : process (data)
	begin
		if falling_edge(data) then
			buff <= buff(58 DOWNTO 0) & data;
		end if;
	end process;
end Behavioral;

