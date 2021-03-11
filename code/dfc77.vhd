----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:32 12/11/2020 
-- Design Name: 
-- Module Name:    dfc77 - Behavioral 
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

entity dfc77 is
	port (
		data : in STD_LOGIC
	);
end dfc77;

architecture Behavioral of dfc77 is
	signal buff : STD_LOGIC_VECTOR(59 DOWNTO 0) := (others => '0');

begin

	process(data)
	begin
		if falling_edge(data) then
			buff <= buff(58 DOWNTO 0) & data; 
		end if;
	end process;

end Behavioral;

