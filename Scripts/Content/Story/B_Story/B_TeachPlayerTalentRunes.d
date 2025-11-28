
func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	var C_Npc ScrollTrader;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_4);
	if(Npc_IsDead(Gorax) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Gorax);
	}
	else if(Npc_IsDead(Isgaroth) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Isgaroth);
	}
	else if(Npc_IsDead(Engor) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Engor);
	}
	else if(Npc_IsDead(Orlan) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Orlan);
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Light,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_5);
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firebolt,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_6);
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Icebolt,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_7);
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightHeal,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_8);
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGobSkel,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_9);
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_InstantFireball,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_10);
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Zap,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_11);
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumWolf,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_12);
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Windfist,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_13);
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Sleep,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_14);
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MediumHeal,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_15);
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightningFlash,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_16);
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ChargeFireBall,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_17);
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumSkel,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_18);
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Fear,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_19);
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceCube,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_20);
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ThunderBall,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_21);
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGol,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_22);
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_HarmUndead,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_23);
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Pyrokinesis,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_24);
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firestorm,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_25);
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceWave,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_26);
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumDemon,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_27);
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_FullHeal,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_28);
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firerain,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_29);
	};
	if(spell == SPL_BreathOfDeath)
	{
		PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_BreathOfDeath,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_30);
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MassDeath,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_31);
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ArmyOfDarkness,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_32);
	};
	if(spell == SPL_Shrink)
	{
		PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Shrink,1);
		B_LogEntry(TOPIC_TalentRunes,TOPIC_TalentRunes_33);
	};
	PrintScreen(PRINT_LearnRunes,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};

