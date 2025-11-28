
instance DIA_Garvell_EXIT(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 999;
	condition = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garvell_PICKPOCKET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 900;
	condition = DIA_Garvell_PICKPOCKET_Condition;
	information = DIA_Garvell_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Es wäre ein Kinderspiel seinen Geldbeutel zu stehlen)";
};


func int DIA_Garvell_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,Dialog_Back,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		B_GiveInvItems(self,other,ItSe_GoldPocket25,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};


instance DIA_Garvell_GREET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_GREET_Condition;
	information = DIA_Garvell_GREET_Info;
	description = "Was machst du hier?";
};


func int DIA_Garvell_GREET_Condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void DIA_Garvell_GREET_Info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Ich baue hier ein Schiff, denn ich will hier weg. Und zwar so schnell, wie es nur geht.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Aber so, wie es momentan aussieht, wird das Schiff niemals fertig.
};


instance DIA_Garvell_eilig(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_eilig_Condition;
	information = DIA_Garvell_eilig_Info;
	description = "Warum hast du es so eilig?";
};


func int DIA_Garvell_eilig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_eilig_Info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Warum hast du es so eilig?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Bald werden die Orks kommen und die Stadt niederbrennen.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Wie kommst du darauf?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Junge, hast du schon die Paladine bemerkt, die überall rumlaufen? Was glaubst du, warum die hier sind?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//Ich sage dir, die sind hier, weil die Orks bald angreifen. Und das wird nicht schön.
};


instance DIA_Garvell_Schiff(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_Schiff_Condition;
	information = DIA_Garvell_Schiff_Info;
	description = "Warum wird dein Schiff nicht fertig?";
};


func int DIA_Garvell_Schiff_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Schiff_Info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Warum wird dein Schiff nicht fertig?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//(winkt ab) Ach, wir haben tausend Probleme. Der Rumpf ist noch nicht stabil und es fehlen noch viele Bretter.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//Aber ich hab kaum noch Gold, um neues Material zu kaufen, und in der letzten Lieferung hatten sich Wanzen eingeschlichen.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Meine Jungs arbeiten nicht produktiv. Der eine will vor allem ein schnelles Schiff, der andere macht sich Gedanken um eine Galionsfigur!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Als ob wir nichts Wichtigeres zu tun hätten!
};


instance DIA_Garvell_MISSION(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_MISSION_Condition;
	information = DIA_Garvell_MISSION_Info;
	permanent = FALSE;
	description = "Kann ich dir irgendwie helfen?";
};


func int DIA_Garvell_MISSION_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_eilig) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Garvell_MISSION_Info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Kann ich dir irgendwie helfen?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//Ja, das kannst du. Finde heraus, was die Paladine vorhaben. Ich will wissen, warum sie hier sind.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//Und ich muss wissen, ob die Orks bald angreifen werden - und wie weit sie von der Stadt entfernt sind.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Es wurde nämlich schon einer von den Bastarden vor der Stadt gesehen.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Bringe mir einfach alle Informationen, die du kriegen kannst.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Ich muss wissen, wieviel Zeit mir noch bleibt, um das Boot fertig zu kriegen.
	MIS_Garvell_Infos = LOG_Running;
	Knows_Ork = TRUE;
	Log_CreateTopic(TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Garvell,LOG_Running);
	B_LogEntry(TOPIC_Garvell,"Garvell will Informationen über die Orks und er will wissen, warum die Paladine in der Stadt sind.");
};

func void B_GarvellWeiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Gut. Wenn du noch mehr herausfindest, lass es mich wissen.
};

func void B_GarvellSuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Danke für die Informationen. So wie es aussieht, haben wir alle Zeit der Welt, um unser Schiff zu bauen.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Garvell_Orks(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 3;
	condition = DIA_Garvell_Orks_Condition;
	information = DIA_Garvell_Orks_Info;
	permanent = FALSE;
	description = "Ich habe Informationen über die Orks.";
};


func int DIA_Garvell_Orks_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Orks_Info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//Ich habe Informationen über die Orks.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Lass hören.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Sie sitzen im Minental fest und dort werden sie wohl auch bleiben.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Zur Sicherheit lassen die Paladine den Pass bewachen.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Paladine(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_Paladine_Condition;
	information = DIA_Garvell_Paladine_Info;
	permanent = FALSE;
	description = "Ich weiß, warum die Paladine hier sind. ";
};


func int DIA_Garvell_Paladine_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (KnowsPaladins_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Paladine_Info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//Ich weiß, warum die Paladine hier sind.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Wirklich? Erzähl!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Die Paladine sind hier, um das magische Erz aus dem Minental zu holen, nicht, weil die Orks die Stadt angreifen wollen.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Sobald sie das Erz haben, werden sie wieder zum Festland zurückkehren.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_City(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 4;
	condition = DIA_Garvell_City_Condition;
	information = DIA_Garvell_City_Info;
	permanent = FALSE;
	description = "Was den Ork vor der Stadt angeht ...";
};


func int DIA_Garvell_City_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 2))
	{
		return TRUE;
	};
};

func void DIA_Garvell_City_Info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//Was den Ork vor der Stadt angeht ...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Jaaa ... ?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Mach dir über ihn keine Gedanken. Die Stadtwache wird sich um ihn kümmern.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Perm(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 13;
	condition = DIA_Garvell_Perm_Condition;
	information = DIA_Garvell_Perm_Info;
	permanent = TRUE;
	description = "Was ist denn so im Hafen los?";
};


func int DIA_Garvell_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_MISSION))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Perm_Info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Was ist denn so im Hafen los?
	if(MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Die Orks rücken uns auf den Pelz und du fragst nach dem Hafen?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Ich wollte ja nur ...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//Das größte Problem, das wir haben, ist, dass im Hafen nicht genug Schiffe liegen, um uns von hier zu verdrücken.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Um ehrlich zu sein, liegt hier nur ein Schiff, und das gehört den Paladinen. Die lassen uns bestimmt nicht damit abhauen.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Schau dich doch selbst um, hier ist tote Hose.
	};
};

