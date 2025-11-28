
instance ItSe_ErzFisch(C_Item)
{
	name = "Kugeliger Fisch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ErzFisch;
	description = name;
	text[2] = "Irgendwas ist in diesem Fisch versteckt";
};


func void Use_ErzFisch()
{
	CreateInvItems(hero,ItMi_Nugget,1);
	Print(PRINT_FoundOreNugget);
};


instance ItSe_GoldFisch(C_Item)
{
	name = "Schwerer Fisch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_GoldFisch;
	description = name;
	text[2] = "Irgendwas ist in diesem Fisch versteckt";
};


func void Use_GoldFisch()
{
	CreateInvItems(hero,ItMi_Gold,50);
	Print(PRINT_FoundGold50);
	Snd_Play("Geldbeutel");
};


instance ItSe_Ringfisch(C_Item)
{
	name = "Kleiner Fisch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Ringfisch;
	description = name;
	text[2] = "Irgendwas ist in diesem Fisch versteckt";
};


func void Use_Ringfisch()
{
	CreateInvItems(hero,ItRi_Prot_Fire_01,1);
	Print(PRINT_FoundRing);
};


instance ItSe_LockpickFisch(C_Item)
{
	name = "Leichter Fisch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_LockpickFisch;
	description = name;
	text[2] = "Irgendwas ist in diesem Fisch versteckt";
};


func void Use_LockpickFisch()
{
	CreateInvItems(hero,ItKE_lockpick,3);
	Print(PRINT_FoundLockpick);
};


instance ItSe_GoldPocket25(C_Item)
{
	name = "Lederbeutel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket25;
	description = "Ein Lederbeutel";
	text[0] = "";
	text[1] = "";
	text[2] = "Ein paar Münzen klimpern darin";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket25()
{
	CreateInvItems(hero,ItMi_Gold,25);
	Print(PRINT_FoundGold25);
	Snd_Play("Geldbeutel");
};


instance ItSe_GoldPocket50(C_Item)
{
	name = "Lederbeutel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket50;
	description = "Ein Lederbeutel";
	text[0] = "";
	text[1] = "";
	text[2] = "Der Beutel ist voller Münzen";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket50()
{
	CreateInvItems(hero,ItMi_Gold,50);
	Print(PRINT_FoundGold50);
	Snd_Play("Geldbeutel");
};


instance ItSe_GoldPocket100(C_Item)
{
	name = "Lederbeutel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket100;
	description = "Ein Lederbeutel";
	text[0] = "";
	text[1] = "";
	text[2] = "Ein schwerer Beutel";
	text[3] = "gefüllt mit goldenen Münzen";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket100()
{
	CreateInvItems(hero,ItMi_Gold,100);
	Print(PRINT_FoundGold100);
	Snd_Play("Geldbeutel");
};


instance ItSe_HannasBeutel(C_Item)
{
	name = "Lederbeutel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = HannasBeutel;
	description = "Ein Lederbeutel";
	text[0] = "";
	text[1] = "";
	text[2] = "Hanna hat ihn mir gegeben";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void HannasBeutel()
{
	CreateInvItems(hero,ItKE_lockpick,10);
	CreateInvItems(hero,ItKe_ThiefTreasure,1);
	Print(PRINT_HannasBeutel);
};

