
func void potionalchemy_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PotionAlchemy;
		AI_ProcessInfos(her);
	};
};


instance PC_PotionAlchemy_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PotionAlchemy_End_Condition;
	information = PC_PotionAlchemy_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_PotionAlchemy_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_End_Info()
{
	CreateInvItems(self,ItMi_Flask,1);
	b_endproductiondialog();
};


instance PC_Charge_InnosEye(C_Info)
{
	nr = 1;
	npc = PC_Hero;
	condition = PC_Charge_InnosEye_Condition;
	information = PC_Charge_InnosEye_Info;
	permanent = TRUE;
	description = "Das Auge Innos wieder aufladen.";
};


func int PC_Charge_InnosEye_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] == TRUE) && (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
	{
		return TRUE;
	};
};

func void PC_Charge_InnosEye_Info()
{
	if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)) && (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
	{
		if(Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_SwampdragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_RockdragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_FiredragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_IcedragonHeart,1);
		};
		Npc_RemoveInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
		CreateInvItems(hero,ItMi_InnosEye_MIS,1);
		Print(PRINT_AlchemySuccessInnoseye);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Mana_01(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_01_Condition;
	information = PC_ItPo_Mana_01_Info;
	permanent = TRUE;
	description = "Mana Essenz (2 Feuernesseln, 1 Feldknöterich)";
};


func int PC_ItPo_Mana_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_01_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_01) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_01,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_01,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Mana_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_02_Condition;
	information = PC_ItPo_Mana_02_Info;
	permanent = TRUE;
	description = "Mana Extrakt (2 Feuerkraut, 1 Feldknöterich) ";
};


func int PC_ItPo_Mana_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_02_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_02,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Mana_03(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_03_Condition;
	information = PC_ItPo_Mana_03_Info;
	permanent = TRUE;
	description = "Mana Elixier (2 Feuerwurzeln, 1 Feldknöterich)";
};


func int PC_ItPo_Mana_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_03_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_03,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Health_01(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Health_01_Condition;
	information = PC_ItPo_Health_01_Info;
	permanent = TRUE;
	description = "Essenz der Heilung (2 Heilplanzen, 1 Feldknöterich)";
};


func int PC_ItPo_Health_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_01_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_01) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItem(hero,ItPo_Health_01);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Health_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Health_02_Condition;
	information = PC_ItPo_Health_02_Info;
	permanent = TRUE;
	description = "Extrakt der Heilung (2 Heilkräuter, 1 Feldknöterich)";
};


func int PC_ItPo_Health_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_02_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_02,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Health_03(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Health_03_Condition;
	information = PC_ItPo_Health_03_Info;
	permanent = TRUE;
	description = "Elixier der Heilung (2 Heilwurzeln, 1 Feldknöterich)";
};


func int PC_ItPo_Health_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_03_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_03) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_03,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Perm_Health(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Health_Condition;
	information = PC_ItPo_Perm_Health_Info;
	permanent = TRUE;
	description = "Elixier des Lebens (1 Heilwurzel, 1 Kronstöckel)";
};


func int PC_ItPo_Perm_Health_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Health_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_Health,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Perm_Mana(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Mana_Condition;
	information = PC_ItPo_Perm_Mana_Info;
	permanent = TRUE;
	description = "Elixier des Geistes (1 Feuerwurzel, 1 Kronstöckl)";
};


func int PC_ItPo_Perm_Mana_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Mana_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_Mana,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Dex(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Dex_Condition;
	information = PC_ItPo_Dex_Info;
	permanent = TRUE;
	description = "Trank des Geschicks (1 Goblin Beere, 1 Kronstöckl)";
};


func int PC_ItPo_Dex_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Dex_Info()
{
	if((Npc_HasItems(hero,ItPl_Dex_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Dex_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_DEX,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Strg(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Strg_Condition;
	information = PC_ItPo_Strg_Info;
	permanent = TRUE;
	description = "Trank der Stärke (1 Drachenwurzel, 1 Kronstöckl)";
};


func int PC_ItPo_Strg_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Strg_Info()
{
	if((Npc_HasItems(hero,ItPl_Strength_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Strength_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_STR,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Speed(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Speed_Condition;
	information = PC_ItPo_Speed_Info;
	permanent = TRUE;
	description = "Trank der Geschwindigkeit (1 Snapperkraut, 1 Feldknöterich)";
};


func int PC_ItPo_Speed_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Speed_Info()
{
	if((Npc_HasItems(hero,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Speed,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItMi_Joint(C_Info)
{
	nr = 10;
	npc = PC_Hero;
	condition = PC_ItMi_Joint_Condition;
	information = PC_ItMi_Joint_Info;
	permanent = TRUE;
	description = "Sumpfkraut verarbeiten (1 Stengel)";
};


func int PC_ItMi_Joint_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1))
	{
		return TRUE;
	};
};

func void PC_ItMi_Joint_Info()
{
	Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
	CreateInvItems(hero,ItMi_Joint,1);
	Print(PRINT_JointSuccess);
	b_endproductiondialog();
};


instance PC_ItMi_Tabak(C_Info)
{
	nr = 10;
	npc = PC_Hero;
	condition = PC_ItMi_Tabak_Condition;
	information = PC_ItMi_Tabak_Info;
	permanent = TRUE;
	description = "Tabak mischen...";
};


func int PC_ItMi_Tabak_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (Npc_HasItems(hero,ItMi_ApfelTabak) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1))
	{
		return TRUE;
	};
};

func void PC_ItMi_Tabak_Info()
{
	Npc_RemoveInvItems(hero,ItMi_ApfelTabak,1);
	Info_ClearChoices(PC_ItMi_Tabak);
	Info_AddChoice(PC_ItMi_Tabak,Dialog_Back,PC_ItMi_Tabak_BACK);
	if(Npc_HasItems(hero,ItFo_Honey) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"...mit Honig",PC_ItMi_Tabak_Honey);
	};
	if(Npc_HasItems(hero,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"...mit Sumpfkraut",PC_ItMi_Tabak_Swampherb);
	};
	if(Npc_HasItems(hero,ItPl_Mushroom_01) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"...mit Dunkelpilz",PC_ItMi_Tabak_Mushroom_01);
	};
};

func void PC_ItMi_Tabak_BACK()
{
	Info_ClearChoices(PC_ItMi_Tabak);
};

func void PC_ItMi_Tabak_Honey()
{
	CreateInvItems(hero,ItMi_Honigtabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};

func void PC_ItMi_Tabak_Swampherb()
{
	CreateInvItems(hero,ItMi_SumpfTabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};

func void PC_ItMi_Tabak_Mushroom_01()
{
	CreateInvItems(hero,ItMi_PilzTabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};


instance PC_ItPo_MegaDrink(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_MegaDrink_Condition;
	information = PC_ItPo_MegaDrink_Info;
	permanent = TRUE;
	description = "Dracheneitrunk (10 Drachenei, 1 schwarze Perle, 1 Schwefel)";
};


func int PC_ItPo_MegaDrink_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_MegaDrink_Info()
{
	if((Npc_HasItems(hero,ItAt_DragonEgg_MIS) >= 10) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,ItAt_DragonEgg_MIS,10);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		CreateInvItems(hero,ItPo_MegaDrink,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};

