
instance DIA_Mil_310_Stadtwache_EXIT(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 999;
	condition = DIA_Mil_310_Stadtwache_EXIT_Condition;
	information = DIA_Mil_310_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_310_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_310_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_310_Checkpoint = "NW_CITY_ENTRANCE_MAIN";

var int MIL_310_Personal_AbsolutionLevel;

instance DIA_Mil_310_Stadtwache_FirstWarn(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_310_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_310_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//HALT!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//(seufzt) Was denn?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//Das weißt du ganz genau!
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//Du wirst in der Stadt als Mörder gesucht!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//Dreckige Diebe brauchen wir hier nicht!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//Unruhestifter können wir in unserer Stadt nicht gebrauchen!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//Warum, glaubst du, sollten wir dich reinlassen?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//Was denn?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//DU kommst hier nicht rein, mein Junge!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//Warum nicht?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//So abgerissen, wie du aussiehst, machst du hier bestimmt nur Ärger!
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//Wir haben schon genug Gesindel in der Stadt. Leute ohne Geld können wir nicht gebrauchen.
			Log_CreateTopic(TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_City,LOG_Running);
			B_LogEntry(TOPIC_City,TOPIC_City_3);
		}
		else if((Hlp_IsItem(itm,ITAR_Bau_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE))
		{
			if(self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//Was willst du schon wieder?
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//Der Bauer schickt mich.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//So? Hast du diesmal wenigstens 'nen guten Grund herzukommen?
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//Bist du einer der Knechte von Lobarts Hof? Ich hab dich hier noch nie gesehen!
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//Ich bin noch nicht lange bei Lobart.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//Was willst du in der Stadt?
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//(ruhig) Was?
			if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//Verzeihung, aber so sind nun mal die Vorschriften.
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//Willst du mich aufhalten?
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//Natürlich nicht. Alle Angehörigen der Kirche Innos' sind uns selbstverständlich willkommen.
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//Wollte dich nur mal ansehen. Siehst aus, als ob du Geld hättest. Kannst reingehen.
			};
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			Mil_310_schonmalreingelassen = TRUE;
			B_CheckLog();
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_310_Stadtwache_SecondWarn(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_310_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//Jetzt werd mal nicht ulkig. Noch einen Schritt und ich hack dich in Stücke!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Attack(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_Attack_Condition;
	information = DIA_Mil_310_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//Du hast es so gewollt ...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_310_Stadtwache_Bribe(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_Bribe_Condition;
	information = DIA_Mil_310_Stadtwache_Bribe_Info;
	permanent = TRUE;
	description = "Hier sind 100 Goldstücke. Lass mich rein!";
};


func int DIA_Mil_310_Stadtwache_Bribe_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Hier sind 100 Goldstücke. Lass mich rein!
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//(gierig) 100 Goldstücke klingen gut. Dann mal immer rein mit dir.
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//Und geh direkt zu Lord Andre! Sonst knöpf ich dir beim nächsten Mal wieder 100 Goldstücke ab!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		Mil_310_schonmalreingelassen = TRUE;
		B_CheckLog();
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//Was?! Wo?! Ich sehe keine 100 Goldmünzen. Hau ab!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Passierschein(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 4;
	condition = DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information = DIA_Mil_310_Stadtwache_Passierschein_Info;
	permanent = FALSE;
	description = "Ich habe einen Passierschein!";
};


func int DIA_Mil_310_Stadtwache_Passierschein_Condition()
{
	if(Npc_HasItems(other,ItWr_Passierschein) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Passierschein_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//Ich habe einen Passierschein!
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//Tatsächlich? Und wen hast du dafür umgelegt, du Halsabschneider?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Wollt ihr mich jetzt reinlassen oder nicht?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//Na geh schon rein, bevor ich's mir anders überlege!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Scheint in Ordnung zu sein. Weiter gehen.
	};
	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_ZumSchmied(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_ZumSchmied_Condition;
	information = DIA_Mil_310_Stadtwache_ZumSchmied_Info;
	permanent = FALSE;
	description = "Ich will zum Schmied. Werkzeuge reparieren lassen.";
};


func int DIA_Mil_310_Stadtwache_ZumSchmied_Condition()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(((Hlp_IsItem(itm,ITAR_Bau_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE)) && Npc_KnowsInfo(other,DIA_Maleth_ToTheCity) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_ZumSchmied_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//Ich will zum Schmied. Werkzeuge reparieren lassen.
	if(Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//(böse) Ach? Und warum sagst du das nicht gleich?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//Ich wollte mal sehen, wie du reagierst.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//Was?! Mach so was noch mal mit mir und ich werd dir zeigen, wie ich auf so was reagiere, du dummer Bauernlümmel!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//Na schön, dann mach mal, dass du reinkommst.
	};
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//Und wenn du Lobart siehst, kannst du ihm sagen, er soll die Schafe gut füttern, wir kommen demnächst wieder zu ihm! (lacht dreckig)
	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_MilizWerden(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_MilizWerden_Condition;
	information = DIA_Mil_310_Stadtwache_MilizWerden_Info;
	permanent = FALSE;
	description = "Ich bin gekommen, um mich der Miliz anzuschließen!";
};


func int DIA_Mil_310_Stadtwache_MilizWerden_Condition()
{
	if(Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_MilizWerden_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//Ich bin gekommen, um mich der Miliz anzuschließen!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//Der ist gut! Versuch's damit mal beim anderen Stadttor - vielleicht kaufen DIE dir das ab.
	Mil_310_Scheisse_erzaehlt = TRUE;
};


instance DIA_Mil_310_Stadtwache_Paladine(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_Paladine_Condition;
	information = DIA_Mil_310_Stadtwache_Paladine_Info;
	permanent = FALSE;
	description = "Ich muss zum Anführer der Paladine! ...";
};


func int DIA_Mil_310_Stadtwache_Paladine_Condition()
{
	if(Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Paladine_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//Ich muss zum Anführer der Paladine! Ich habe eine wichtige Nachricht für ihn!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//Ach? Und was könnte das wohl für eine wichtige Nachricht sein?
	Mil_310_Scheisse_erzaehlt = TRUE;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Die Stadt wird bald angegriffen!",DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Die Armee des Bösen lagert im Tal von Khorinis!",DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ich bin gekommen um das Auge Innos zu holen!",DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//Ich bin gekommen, um das Auge Innos' zu holen!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//Was? Nie gehört - was soll das sein?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//Es ist ein wichtiges Artefakt.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//Du siehst aber nicht wie ein wichtiger Bote aus. Hast du etwas, womit du dich ausweisen kannst?
	if(!Npc_HasItems(other,ItWr_Passierschein) > 0)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//Habe ich nicht!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//Dann verschwende nicht meine Zeit!
	};
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//Die Armee des Bösen lagert im Tal von Khorinis!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//Im Minental? Kommst du von dort? Hast du die Armee gesehen?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Nein - aber ich wurde von jemandem geschickt, der sie gesehen hat.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Nein. Aber ich weiß, daß sie von Drachen angeführt wird!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ja. Ich war im Tal von Khorinis. Ich habe riesige Drachen gesehen!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//Die Stadt wird bald angegriffen!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//Was? Von wem? Von den Orks? Hast du ihre Armee gesehen?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Nein - aber ich wurde von jemandem geschickt, der sie gesehen hat.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Nein. Aber ich weiß, daß sie von Drachen angeführt wird!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ja. Ich war im Tal von Khorinis. Ich habe riesige Drachen gesehen!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//Nein. Aber ich weiß, dass sie von Drachen geführt wird!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//Sicher! Und meine Großmutter berät die Generäle der Orks.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//Du glaubst doch nicht, dass wir dich mit so einem Ammenmärchen zu Lord Hagen lassen!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//Verschwinde!
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//Nein - aber ich wurde von jemandem geschickt, der sie gesehen hat.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//(misstrauisch) WER schickt dich?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Es ist mir nicht erlaubt, dir das zu sagen.",DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ein Paladin.",DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ein Magier.",DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//Ja. Ich war im Tal von Khorinis. Ich habe riesige Drachen gesehen!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//Du lügst doch! Der Pass zum Tal wird von beiden Seiten gehalten. Niemand kommt da durch!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//Mach, dass du wegkommst!
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_AMage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//Ein Magier.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//Du hast Nachricht von den Magiern? Dann hast du sicherlich ein Siegel als Beweis!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//Nein.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//Was? Die Magier geben ihren Boten IMMER ein Siegel.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//Dieser Magier nicht.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//Ich glaube dir nicht. Wenn du wirklich ein Bote bist, dann spuck jetzt deine Nachricht aus oder zieh Leine!
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ich gebe die Nachricht nur den Paladinen!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Die Armee des Bösen wird von Drachen angeführt!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//Ein Paladin.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//Hm, das kann schon sein - die Paladine halten den Pass zum Minental.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//Gib mir deine Nachricht und ich werde dich melden.
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ich gebe die Nachricht nur den Paladinen!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Die Armee des Bösen wird von Drachen angeführt!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//Es ist mir nicht erlaubt, dir das zu sagen.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//Jetzt komm mir nicht so, Junge! Ich bin Angehöriger der Stadtwache.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//Du kannst mir ALLES sagen. Also - wer schickt dich?
};

func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//Die Armee des Bösen wird von Drachen geführt!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//Was? Das darf doch nicht wahr sein. Um ein Haar hätte ich dich reingelassen.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//Wenn du DIE Geschichte Lord Hagen aufgetischt hättest, hätte ich mich warm anziehen können.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//Verschwinde!
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//Ich gebe die Nachricht nur den Paladinen!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//So läuft das nicht, Junge!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//Ich werd den Teufel tun, dich zu Lord Hagen zu lassen, wenn ich nicht sicher bin, dass du ihm nicht seine kostbare Zeit stiehlst.
	Player_KnowsLordHagen = TRUE;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Nein. Die Nachricht ist NUR für die Paladine bestimmt.",DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Die Armee des Bösen wird von Drachen angeführt!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//Nein. Die Nachricht ist NUR für die Paladine bestimmt.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//Dann endet deine Reise hier, Fremder.
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_PERM(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_PERM_Condition;
	information = DIA_Mil_310_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_PERM_Info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");	//Weitergehen!
	AI_StopProcessInfos(self);
};

