----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:08 11/17/2020 
-- Design Name: 
-- Module Name:    clock - Behavioral 
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

entity clock is
	port (
		MainClk : in STD_LOGIC;
		KEY1 : in STD_LOGIC;
		KEY2 : in STD_LOGIC;
		KEY3 : in STD_LOGIC;
		KEY4 : in STD_LOGIC;
		DIG0 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		DIG1 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		DIG2 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		DIG3 : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end clock;

architecture Behavioral of clock is

component FDivider
	port (
		Clk : in STD_LOGIC;
		FSec : out STD_LOGIC;
		F8ms : out STD_LOGIC
	);
end component;

component PushButton
	port (
		KClk : in STD_LOGIC;
		KeyIn : in STD_LOGIC;
		Status : out STD_LOGIC
	);
end component;

component decconv
	port (
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		Seg_A : out STD_LOGIC;
		Seg_B : out STD_LOGIC;
		Seg_C : out STD_LOGIC;
		Seg_D : out STD_LOGIC;
		Seg_E : out STD_LOGIC;
		Seg_F : out STD_LOGIC;
		Seg_G : out STD_LOGIC	
	);
end component;

component deccount
	generic (maxval : integer := 99);
	port (
		clkin : in STD_LOGIC;
		rst : in STD_LOGIC;
		clkout : out STD_LOGIC;
		val : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;

signal secondsbcd : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal minutesbcd : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal hoursbcd : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal indisp0 : STD_LOGIC_VECTOR(7 DOWNTO 0); 
signal indisp1 : STD_LOGIC_VECTOR(7 DOWNTO 0); 
signal F8ms : STD_LOGIC;
signal FSec : STD_LOGIC;
signal FMin : STD_LOGIC;
signal FHour : STD_LOGIC;
signal dot : STD_LOGIC;
signal chmod : STD_LOGIC;
signal settime : STD_LOGIC;
signal sethour : STD_LOGIC;
signal setminute : STD_LOGIC;
signal showhr : STD_LOGIC := '1';

begin

	dzielnik : FDivider port map (
		Clk => MainClk,
		FSec => FSec,
		F8ms => F8ms
	);
	
	modeBtn : PushButton port map (
		KClk => F8ms,
		KeyIn => KEY1,
		Status => chmod
	);
	
	setBtn : PushButton port map (
		KClk => F8ms,
		KeyIn => KEY2,
		Status => settime
	);

	setHr : PushButton port map (
		KClk => F8ms,
		KeyIn => KEY3,
		Status => sethour
	);	

	setMn : PushButton port map (
		KClk => F8ms,
		KeyIn => KEY4,
		Status => setminute
	);		
	
	seccount : deccount
		generic map (maxval => 59)
		port map (
			clkin => FSec,
			rst => '1',
			clkout => FMin,
			val => secondsbcd
		);
		
	mincount : deccount
		generic map (maxval => 59)
		port map (
			clkin => FMin,
			rst => '1',
			clkout => FHour,
			val => minutesbcd
		);
		
	hourcount : deccount
		generic map (maxval => 23)
		port map (
			clkin => FHour,
			rst => '1',
			clkout => open,
			val => hoursbcd
		);	
	
	display1 : decconv port map (
		A => indisp0(0),
		B => indisp0(1),
		C => indisp0(2),
		D => indisp0(3),
		Seg_A => DIG1(0),
		Seg_B => DIG1(1),
		Seg_C => DIG1(2),
		Seg_D => DIG1(3),
		Seg_E => DIG1(4),
		Seg_F => DIG1(5),
		Seg_G => DIG1(6)
	);
	
	display10 : decconv port map (
		A => indisp0(4),
		B => indisp0(5),
		C => indisp0(6),
		D => indisp0(7),
		Seg_A => DIG0(0),
		Seg_B => DIG0(1),
		Seg_C => DIG0(2),
		Seg_D => DIG0(3),
		Seg_E => DIG0(4),
		Seg_F => DIG0(5),
		Seg_G => DIG0(6)
	);

	display2 : decconv port map (
		A => indisp1(0),
		B => indisp1(1),
		C => indisp1(2),
		D => indisp1(3),
		Seg_A => DIG3(0),
		Seg_B => DIG3(1),
		Seg_C => DIG3(2),
		Seg_D => DIG3(3),
		Seg_E => DIG3(4),
		Seg_F => DIG3(5),
		Seg_G => DIG3(6)
	);
	
	display20 : decconv port map (
		A => indisp1(4),
		B => indisp1(5),
		C => indisp1(6),
		D => indisp1(7),
		Seg_A => DIG2(0),
		Seg_B => DIG2(1),
		Seg_C => DIG2(2),
		Seg_D => DIG2(3),
		Seg_E => DIG2(4),
		Seg_F => DIG2(5),
		Seg_G => DIG2(6)
	);

	mode_proce : process(chmod)
	begin
		if falling_edge(chmod) then
			showhr <= not showhr;
		end if;
	end process;
	
	clock_proc: process(FSec)
	begin
		if rising_edge(FSec) then			
			dot <= not dot;
		end if;
	end process;
	
	indisp0 <= hoursbcd when (showhr = '1') else (others => '1');
	indisp1 <= minutesbcd when (showhr = '1') else secondsbcd;
	
	DIG0(7) <= '0';
	DIG1(7) <= dot;
	DIG2(7) <= '0';	
	DIG3(7) <= '0';

end Behavioral;

