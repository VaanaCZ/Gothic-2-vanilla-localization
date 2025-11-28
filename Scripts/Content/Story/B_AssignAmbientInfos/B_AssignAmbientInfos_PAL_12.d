
instance DIA_PAL_12_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_12_EXIT_Condition;
	information = DIA_PAL_12_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_12_JOIN_Condition;
	information = DIA_PAL_12_JOIN_Info;
	permanent = TRUE;
	description = "Ich will ein Paladin werden!";
};


func int DIA_PAL_12_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Ich will ein Paladin werden!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Du? Dass ich nicht lache! Du gehörst ja noch nicht einmal der Stadtwache an.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Wenn ich nicht sehen würde, was für ein dummer Bursche du bist, würde ich annehmen, dass du mich beleidigen willst.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Als Paladine werden nur die Besten der Besten unter den Getreuen des Königs und unseres Herrn Innos aufgenommen.
};


instance DIA_PAL_12_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_12_PEOPLE_Condition;
	information = DIA_PAL_12_PEOPLE_Info;
	permanent = TRUE;
	description = "Wer hat hier das Kommando?";
};


func int DIA_PAL_12_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Wer hat hier das Kommando?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Das ist der ehrenwerte Lord Hagen. Aber für alle Belange des einfachen Volkes ist Lord Andre zuständig.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Du findest ihn in der Kaserne. Vielleicht hast du Glück und er widmet dir ein paar Minuten seiner kostbaren Zeit.
};


instance DIA_PAL_12_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_12_LOCATION_Condition;
	information = DIA_PAL_12_LOCATION_Info;
	permanent = TRUE;
	description = "Was macht ihr Paladine hier in Khorinis?";
};


func int DIA_PAL_12_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Was macht ihr Paladine hier in Khorinis?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Wer solche Fragen stellt, endet ziemlich schnell am Galgen.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//Wenn Lord Hagen sich EINE Sache nicht leisten kann, dann ist dies, das Wissen über unsere Mission in die Hände von Spionen fallen zu lassen.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//Also pass besser auf, wonach du fragst.
};


instance DIA_PAL_12_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_12_STANDARD_Condition;
	information = DIA_PAL_12_STANDARD_Info;
	permanent = TRUE;
	description = "Wie ist die Lage?";
};


func int DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Wie ist die Lage?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Jetzt, da wir wissen, dass wir es mit Drachen zu tun haben, wird unser Kommandant sicherlich bald etwas unternehmen.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//Wir haben noch immer keine Nachricht von unserem Trupp im Minental. Das ist sehr beunruhigend.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//Innos sei Dank! Die Bedrohung der Drachen ist abgewendet. Jetzt müssen wir uns nur noch um die Orks kümmern, um an das Erz zu kommen.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Du erwartest doch nicht im Ernst von mir eine Antwort auf diese Frage, Busche!
	};
};

func void B_AssignAmbientInfos_PAL_12(var C_Npc slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

