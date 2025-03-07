library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_8_Bits is
	port
		(i_DataA		:	in		std_logic_vector(7 downto 0)
		;i_DataB		:	in		std_logic_vector(7 downto 0)
		;i_Select	:	in		std_logic_vector(2 downto 0)
		;o_Data		:	out	std_logic_vector(7 downto 0)
		);
end entity;

Architecture rtl of ALU_8_Bits is
	signal	s_XorA,s_XorB,s_Add			:	std_logic_vector(7 downto 0);
	signal	s_S2Ext							:	std_logic_vector(7 downto 0);
	signal	s_And								:	std_logic_vector(7 downto 0);
	signal	s_Xor								:	std_logic_vector(7 downto 0);
	signal	s_ShiftL,s_ShiftR,s_Shift	:	std_logic_vector(7 downto 0);
	signal	s_MX0,s_MX1,s_MX				:	std_logic_vector(7 downto 0);
begin
	s_S2Ext	<=	(others	=>	i_Select(2));
	s_XorA	<=	s_S2Ext	xor	i_DataA;
	s_XorB	<=	s_S2Ext	xor	i_DataB;
	s_Add		<=	std_logic_vector(unsigned(s_XorA) + unsigned(i_DataB));
	
	s_And		<=	s_XorA	and	s_XorB;
	
	s_Xor		<=	i_DataA	xor	i_DataB;
	
	s_ShiftL	<=	std_logic_vector(Shift_Left(unsigned(s_XorB),to_integer(unsigned(i_DataA(2 downto 0)))));
	s_ShiftR	<=	std_logic_vector(Shift_Right(unsigned(s_XorB),to_integer(unsigned(i_DataA(2 downto 0)))));
	
	process(i_DataA(3),s_ShiftL,s_ShiftR)
	begin
		if(i_DataA(3)	=	'0') then
			s_Shift	<=	s_ShiftL;
		else
			s_Shift	<=	s_ShiftR;
		end if;
	end process;
	
	process(i_Select(1 downto 0),s_Add,s_And,s_Xor,s_Shift,s_MX0,s_MX1)
	begin
		if(i_Select(0) =	'0') then
			s_MX0	<=	s_Add;
			s_MX1	<=	s_Xor;
		else
			s_MX0	<=	s_And;
			s_MX1	<=	s_Shift;
		end if;
		
		if(i_Select(1)	=	'0') then
			s_MX	<=	s_MX0;
		else
			s_MX	<=	s_MX1;
		end if;
	end process;
	
	o_Data	<=	s_S2Ext	xor	s_MX;
	
end rtl;