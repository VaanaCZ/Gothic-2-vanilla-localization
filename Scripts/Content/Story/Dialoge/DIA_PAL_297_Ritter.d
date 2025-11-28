
instance DIA_PAL_297_EXIT(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 999;
	condition = DIA_PAL_297_EXIT_Condition;
	information = DIA_PAL_297_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_297_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 2;
	condition = DIA_PAL_297_TRESPAS_Condition;
	information = DIA_PAL_297_TRESPAS_Info;
	permanent = TRUE;
	description = "Wie steht's? ";
};


func int DIA_PAL_297_TRESPAS_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_TRESPAS_Info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//Wie steht's?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Die Gegend hier ist ziemlich gefährlich, also kehr besser um - wir wollen ja nicht, dass dir was passiert.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Ziemlich wagemutig von dir, das Tal zu betreten. Hauptsache, du hast genug Heiltränke dabei.
	};
};

