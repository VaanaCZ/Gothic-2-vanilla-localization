
instance DIA_Fernando_EXIT(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Fernando_PICKPOCKET(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 900;
	condition = DIA_Fernando_PICKPOCKET_Condition;
	information = DIA_Fernando_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Es wäre gewagt seinen Geldbeutel zu stehlen)";
};


func int DIA_Fernando_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Fernando_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,Dialog_Back,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
};


instance DIA_Fernando_Hello(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = "Wie laufen die Geschäfte?";
};


func int DIA_Fernando_Hello_Condition()
{
	if(NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Wie laufen die Geschäfte?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nicht gut. Früher, als die Barriere noch stand, da waren die Zeiten besser.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Die Gefangenen haben das Erz kistenweise aus den Minen geschürft und meine Schiffe haben es zum Festland transportiert.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//Und auf dem Rückweg haben sie Nahrung und andere Waren mitgebracht
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Aber jetzt, da wir vom Festland abgeschnitten sind, sind wir auf die Versorgung durch die Bauern angewiesen.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "Womit verdienst du jetzt dein Gold? ";
};


func int DIA_Fernando_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Womit verdienst du jetzt dein Gold?
	if(Npc_KnowsInfo(other,DIA_Fernando_Success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Momentan lebe ich von meinen Ersparnissen. Aber wenn es mir nicht gelingt, wieder ins Geschäft zu kommen, werden harte Zeiten auf mich zukommen.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Ich bin ruiniert. Hätte ich nur auf meinen Vater gehört und wäre nie in das Erzgeschäft eingestiegen.
	};
};


instance DIA_Fernando_Minental(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fernando_Minental_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2) && (EnterOW_Kapitel2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Hey du - warte mal. Du willst dich doch auf den Weg ins Minental machen, richtig?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//Und?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Ich schlage dir ein Geschäft vor. Du berichtest mir, wie es dort um das Erz steht und ich besorge dir dafür ...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... einen Runenstein.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... einen Ring, der deine Lebenskraft stärkt.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Ich werde sehen, was sich machen lässt.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"Der Händler Fernando will wissen, wie es um das Erz im Minental steht.");
};


instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "Ich war im Minental.";
};


func int DIA_Fernando_Success_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Fernando_Minental))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Ich war im Minental.
	Fernando_Erz = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Fernando_Success_14_01");	//Und? Wie ist die Situation dort?
	AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Die Minen sind alle erschöpft, es gibt kaum mehr als ein paar Kisten voll Erz. Da lohnt sich der Abbau nicht mehr.
	AI_Output(self,other,"DIA_Fernando_Success_14_03");	//Das darf nicht wahr sein. Dann bin ich ruiniert ...
	AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Wie sieht's mit unserem Geschäft aus?
	AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Nun, was deine Belohnung angeht ...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Hier, nimm diesen Runenstein.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Hier ist der Ring.
		B_GiveInvItems(self,other,ItRi_Hp_02,1);
	};
};


instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = "Geht´s dir gut?";
};


func int DIA_Fernando_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Fernando == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_fernando_obsession_gotmoney;

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Heilung(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Heilung_Info;
	permanent = TRUE;
	description = "Du bist besessen.";
};


func int DIA_Fernando_Heilung_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Du bist besessen.
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Geh weg. Jetzt geh doch schon.
	B_NpcClearObsessionByDMT(self);
};

