
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hallo(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Sieh an, wer da ist. Der große Befreier. Na du Held - was suchst du hier?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Ich suche ein paar Antworten.
	AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//Irgendjemand verteilt Zettel mit meinem Gesicht drauf. Irgendjemand meint, dass du das wärst.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Irgendjemand redet zuviel.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_04");	//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//Ich dachte schon, das wäre mein Ende, aber dann tauchte plötzlich aus der Dunkelheit diese ... Gestalt auf.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//Er trug eine schwarze Robe mit Kapuze und eine Maske überm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldstücke für deinen Kopf.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//Hey, was sollte ich machen? Wenn ich abgelehnt hätte, dann hätte er mich getötet!
	B_LogEntry(Topic_Bandits,Topic_Bandits_3);
	MIS_Steckbriefe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Dexter_Glaube(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent = FALSE;
	description = "Ich glaube dir kein Wort.";
};


func int DIA_Dexter_Glaube_Condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_wo) == FALSE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Ich glaube dir kein Wort.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hey, es ist wahr. Ich schwöre beim Grab meiner Mutter!
};


instance DIA_DEXTER_WO(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = dia_dexter_wo_condition;
	information = dia_dexter_wo_info;
	permanent = FALSE;
	description = "Wo finde ich diesen Mann?";
};


func int dia_dexter_wo_condition()
{
	if((Npc_KnowsInfo(other,DIA_Dexter_Glaube) == FALSE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_wo_info()
{
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Wo finde ich diesen Mann?
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle überall unterwegs! Und die suchen dich.
	};
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "Und was hast du jetzt vor? ";
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Glaube) || Npc_KnowsInfo(other,dia_dexter_wo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//Und was hast du jetzt vor? Willst du mich töten?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Ja. Aber du hast uns alle befreit. Deshalb gebe ich dir noch eine Chance. Hau ab - verschwinde, mach dich unsichtbar. Geh und lauf mir nie wieder übern Weg.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Lässt du dich hier noch mal blicken, werde nicht zögern, dich zu töten.
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_KnowsInfo(other,DIA_Dexter_Vor) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Ich habe dich gewarnt. Wenn ich dich nicht töte, wird er mich töten. Also lässt du mir keine Wahl.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Oh Mann, du wärst hier besser nicht aufgetaucht. Du bist der falsche Mann am falschen Ort.
	};
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return C_Beklauen(96,370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

