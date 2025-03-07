library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity	TB	is
end entity;

architecture rtl of TB is
	
	type	t_SelData	is array (0 to 31) of integer;
	type	t_Data		is array (0 to 31) of integer;
	
	constant	c_DataA	:	t_Data		:=	
													(133	,68	,144	,182	,18	,76	,59	,86
													,199	,120	,127	,184	,163	,178	,204	,73
													,105	,111	,129	,254	,120	,231	,217	,14
													,145	,196	,102	,245	,113	,18	,50	,138
													);
	constant	c_DataB	:	t_Data		:=	
													(173	,253	,34	,8		,225	,133	,154	,170
													,155	,187	,102	,190	,99	,51	,169	,25
													,153	,91	,93	,25	,39	,156	,5		,52
													,249	,94	,168	,253	,98	,97	,30	,41
													);
	constant	c_Select	:	t_SelData	:=
													(0		,1		,2		,3		,4		,5		,6		,7
													,0		,1		,2		,3		,4		,5		,6		,7
													,0		,1		,2		,3		,4		,5		,6		,7
													,0		,1		,2		,3		,4		,5		,6		,7
													);
													
	component	ALU_8_Bits	is
		port
			(i_DataA		:	in		std_logic_vector(7 downto 0)
			;i_DataB		:	in		std_logic_vector(7 downto 0)
			;i_Select	:	in		std_logic_vector(2 downto 0)
			;o_Data		:	out	std_logic_vector(7 downto 0)
			);
	end component;
	
	signal	s_DataA,s_DataB,s_Data	:	std_logic_vector(7 downto 0);
	signal	s_Select						:	std_logic_vector(2 downto 0);
	
	file f_results							:	text open write_mode is "Results\Sim_Modelsim.txt";
	
begin
	process
	begin
		for i in 0 to 31 loop
			s_DataA	<=	std_logic_vector(to_unsigned(c_DataA(i),8));
			s_DataB	<=	std_logic_vector(to_unsigned(c_DataB(i),8));
			s_Select	<=	std_logic_vector(to_unsigned(c_Select(i),3));
			wait for 20 ns;
		end loop;
	end process;
	
	A:	ALU_8_Bits	port map (s_DataA, s_DataB, s_Select, s_Data);
	
	process
		variable	linea	:	line;
	begin
		write(linea, string'("A,B,Op,Res"));
		writeline(f_results, linea);
		
		for i in 0 to 31 loop
			wait for 10 ns;
			write(linea, to_integer(unsigned(s_DataA)));
			write(linea, string'(","));
			write(linea, to_integer(unsigned(s_DataB)));
			write(linea, string'(","));
			write(linea, to_integer(unsigned(s_Select)));
			write(linea, string'(","));
			write(linea, to_integer(unsigned(s_Data)));
			writeline(f_results, linea);
			wait for 10 ns;
		end loop;
		wait;
		
	end process;
	
end rtl;