
instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ein Truhenschlüssel";
	text[3] = "von Xardas";
};

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name = "Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = "Canthars Brief für die Händlerin Sarah";
};


const string Canthars_KomproBrief_1 = " 	Letzte Ermahnung";
const string Canthars_KomproBrief_2 = "		Ich habe dir schon mehrere Male auf";
const string Canthars_KomproBrief_3 = "		liebenswürdigste Weise mitgeteilt,";
const string Canthars_KomproBrief_4 = "		daß ich die Waffen, die ich bei dir";
const string Canthars_KomproBrief_5 = "		vor einer Woche bestellt habe, dringend";
const string Canthars_KomproBrief_6 = "		brauche.";
const string Canthars_KomproBrief_7 = "		Wenn ich nicht bald, etwas von dir höre,";
const string Canthars_KomproBrief_8 = "		Sarah, dann sehe ich mich gezwungen,";
const string Canthars_KomproBrief_9 = "		andere Seiten auf zu ziehen. Ich hoffe,";
const string Canthars_KomproBrief_10 = "		wir verstehen uns!!!!!!!!!!!!";
const string Canthars_KomproBrief_11 = "			Onar";

func void Use_Canthars_KomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_2);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_3);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_4);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_5);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_6);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_7);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_8);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_9);
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_10);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Canthars_KomproBrief_11);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = "Rod's Zweihänder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = "Coragons Silber";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TheklasPaket(C_Item)
{
	name = "Theklas Päckchen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = "Schwerer Goldteller";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Auf der Teller sind die Namen";
	text[3] = "Onar und Maria eingraviert.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_ValentinosRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ValentinosRing;
	on_unequip = UnEquip_ValentinosRing;
	description = "Valentinos Ring";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ValentinosRing()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ein Truhenschlüssel";
	text[3] = "von Dexter";
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "Liste";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "Constantinos Kräuterliste";
};


const string Kraeuterliste_1 = "Alchemistische Kräuter";
const string Kraeuterliste_2 = "Heilpflanze";
const string Kraeuterliste_3 = "Heilkraut";
const string Kraeuterliste_4 = "Heilwurzel";
const string Kraeuterliste_5 = "Feuernessel";
const string Kraeuterliste_6 = "Feuerkraut";
const string Kraeuterliste_7 = "Feuerwurzel";
const string Kraeuterliste_8 = "Goblin Beere";
const string Kraeuterliste_9 = "Drachenwurzel";
const string Kraeuterliste_10 = "Snapperkraut";
const string Kraeuterliste_11 = "Feldknöterich";
const string Kraeuterliste_12 = "Kronstöckl";
const string Kraeuterliste_13 = "Anmerkung: Lass dir doch von einem Lehrlings - Anwärter die Pflanzen bringen, dann weißt du ob er was taugt. ";
const string Kraeuterliste_14 = "Gruß, Zuris";

func void Use_Kraeuterliste()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Kraeuterliste_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Kraeuterliste_2);
	Doc_PrintLine(nDocID,0,Kraeuterliste_3);
	Doc_PrintLine(nDocID,0,Kraeuterliste_4);
	Doc_PrintLine(nDocID,0,Kraeuterliste_5);
	Doc_PrintLine(nDocID,0,Kraeuterliste_6);
	Doc_PrintLine(nDocID,0,Kraeuterliste_7);
	Doc_PrintLine(nDocID,0,Kraeuterliste_8);
	Doc_PrintLine(nDocID,0,Kraeuterliste_9);
	Doc_PrintLine(nDocID,0,Kraeuterliste_10);
	Doc_PrintLine(nDocID,0,Kraeuterliste_11);
	Doc_PrintLine(nDocID,0,Kraeuterliste_12);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Kraeuterliste_13);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Kraeuterliste_14);
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "Rezept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = "Rezept der magischen Essenz";
};


const string ManaRezept_1 = "Magische Tränke";
const string ManaRezept_2 = "Zur Herstellung von Tränken der magischen Kraft, benötigt der kundige Alchemist:";
const string ManaRezept_3 = "Feuernessel";
const string ManaRezept_4 = "Feuerkraut";
const string ManaRezept_5 = "Feuerwurzel";
const string ManaRezept_6 = "Dazu braucht er jeweils eine Pflanze ";
const string ManaRezept_7 = "Feldknöterich";
const string ManaRezept_8 = "Meister Neoras ";

func void Use_ManaRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,ManaRezept_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,ManaRezept_2);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,ManaRezept_3);
	Doc_PrintLine(nDocID,0,ManaRezept_4);
	Doc_PrintLine(nDocID,0,ManaRezept_5);
	Doc_PrintLines(nDocID,0,ManaRezept_6);
	Doc_PrintLine(nDocID,0,ManaRezept_7);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,ManaRezept_8);
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein(C_Item)
{
	name = "Passierschein";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[3] = "Mit diesem Schein";
	text[4] = "komme ich an den Stadtwachen vorbei.";
};


const string Passierschein_1 = " 	Passierschein";
const string Passierschein_2 = "			Khorinis	";
const string Passierschein_3 = "		Diese Urkunde berechtigt seinen";
const string Passierschein_4 = "		Besitzer, sich auf unbestimmte Zeit in den";
const string Passierschein_5 = "		unteren Vierteln von Khorinis aufzuhalten.";
const string Passierschein_6 = "			Larius";
const string Passierschein_7 = "			königlicher Statthalter";

func void UsePassierschein()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Passierschein_1);
	Doc_PrintLine(nDocID,0,Passierschein_2);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,Passierschein_3);
	Doc_PrintLine(nDocID,0,Passierschein_4);
	Doc_PrintLine(nDocID,0,Passierschein_5);
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,Passierschein_6);
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,Passierschein_7);
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,"		");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMi_HerbPaket(C_Item)
{
	name = "Kraut- Paket";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ein schweres, klebriges Paket,";
	text[3] = "das nach Sumpfkraut stinkt";
	text[5] = NAME_Value;
	count[5] = 200;
};

instance ItKe_Storage(C_Item)
{
	name = "Lagerhaus- Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel vom";
	text[3] = "Lagerhaus am Hafen";
};


const int HP_Hering = 20;

instance ItFo_SmellyFish(C_Item)
{
	name = "Hering";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_SmellyFish;
	description = "Ein Hering";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Hering;
	text[5] = NAME_Value;
	count[5] = Value_Fish;
};


func void Use_SmellyFish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Hering);
};


instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "Seltsamer Fisch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = "Seltsam aussehender Fisch";
	text[2] = "Irgendwas stimmt nicht mit diesem Fisch.";
	text[3] = "Sieht aus, als wäre er zugenäht...";
};


func void Use_HalvorFish()
{
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "Stinkender Zettel";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "Dieser Zettel war in einem Fisch versteckt";
};


const string HalvorMessage_1 = "	Haltet euren Hintern unten Jungs! ";
const string HalvorMessage_2 = "	Die Miliz ist aufmerksam geworden.";
const string HalvorMessage_3 = "	Keine Überfälle mehr, bis ich mich wieder melde!";
const string HalvorMessage_4 = "												   Halvor";

func void UseHalvorMessage()
{
	var int nDocID;
	Knows_Halvor = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,HalvorMessage_1);
	Doc_PrintLine(nDocID,0,HalvorMessage_2);
	Doc_PrintLine(nDocID,0,HalvorMessage_3);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,HalvorMessage_4);
	Doc_Show(nDocID);
};


instance ItMw_AlriksSword_Mis(C_Item)
{
	name = "Alrik´s Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = 50;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_025_1h_Sld_Sword_01.3DS";
	on_equip = Equip_AlriksSword;
	on_unequip = UnEquip_AlriksSword;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,10);
};

func void UnEquip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-10);
};


instance ItWr_VatrasMessage(C_Item)
{
	name = "Versiegelte Botschaft";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Eine Botschaft von Vatras";
	text[3] = "für die Magier des Feuers";
};


const string VatrasMessage_1 = "Werter Isgaroth,";
const string VatrasMessage_2 = "Ich spüre mehr und mehr die Anwesenheit einer anderen Macht.";
const string VatrasMessage_3 = "Eine Macht, die uns nicht unbekannt ist. Mag es sein, das Diener Beliars nahe sind?";
const string VatrasMessage_4 = "Möglich das ich irre, aber ich denke es wäre angebracht, das Vater Pyrokar sich der Angelegenheit annimmt. ";
const string VatrasMessage_5 = "Mögen unsere Gebete erhört werden.";
const string VatrasMessage_6 = "Vatras";

func void UseVatrasMessage()
{
	var int nDocID;
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,VatrasMessage_1);
	Doc_PrintLines(nDocID,0,VatrasMessage_2);
	Doc_PrintLines(nDocID,0,VatrasMessage_3);
	Doc_PrintLines(nDocID,0,VatrasMessage_4);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,VatrasMessage_5);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,VatrasMessage_6);
	Doc_Show(nDocID);
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = "Botschaft";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageOpen;
	scemeName = "MAP";
	description = name;
	text[2] = "Eine Botschaft von Vatras";
	text[3] = "für die Magier des Feuers";
	text[4] = "Das Siegel ist gebrochen";
};


const string VatrasMessageOpen_1 = "Werter Isgaroth,";
const string VatrasMessageOpen_2 = "Ich spüre mehr und mehr die Anwesenheit einer anderen Macht.";
const string VatrasMessageOpen_3 = "Eine Macht, die uns nicht unbekannt ist. Mag es sein, das Diener Beliars nahe sind?";
const string VatrasMessageOpen_4 = "Möglich das ich irre, aber ich denke es wäre angebracht, das Vater Pyrokar sich der Angelegenheit annimmt. ";
const string VatrasMessageOpen_5 = "Mögen unsere Gebete erhört werden.";
const string VatrasMessageOpen_6 = "Vatras";

func void UseVatrasMessageOpen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,VatrasMessageOpen_1);
	Doc_PrintLines(nDocID,0,VatrasMessageOpen_2);
	Doc_PrintLines(nDocID,0,VatrasMessageOpen_3);
	Doc_PrintLines(nDocID,0,VatrasMessageOpen_4);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,VatrasMessageOpen_5);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,VatrasMessageOpen_6);
	Doc_Show(nDocID);
};


instance ItKe_Hotel(C_Item)
{
	name = "Zimmerschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Zimmerschlüssel";
	text[3] = "vom Hotel";
};

instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name = "verrosteter Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Meersalz hat diesen Schlüssel zerfressen";
};

instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name = "Rostiger Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Kellerschlüssel vom Hotel";
};

instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel zur Pforte";
	text[3] = "des Innos Klosters";
};

instance ItKe_KlosterSchatz(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel zur ";
	text[3] = "Schatzkammer im Kloster";
};

instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel zur ";
	text[3] = "Vorratskammer im Kloster";
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel zum ";
	text[3] = "Gemach im Kloster";
};

instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel zur ";
	text[3] = "Bibliothek im Kloster";
};

instance ItFo_Schafswurst(C_Item)
{
	name = "Schafswurst";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
};


func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	description = "Essenz des Geistes";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_LittleMana()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance Holy_Hammer_MIS(C_Item)
{
	name = "Heiliger Hammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "Schaden:              	 ??";
	text[3] = "benötigte Stärke:     	 ??";
	text[4] = "Zweihandwaffe             ";
	text[5] = "Wert:  nicht einschätzbar";
};

instance ItKe_MagicChest(C_Item)
{
	name = "Alter Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Eine alter eiserner Schlüssel.";
	text[3] = "Er könnnte zu einem ";
	text[4] = "Vorhängeschloss gehören.";
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "Friedensangebot an die Paladine";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[3] = "Mit diesem Schein,sollte ich bei ";
	text[4] = "Lord Hagen vorgelassen werden";
};


const string Passage_1 = "Ehrenwerter Lord Hagen,";
const string Passage_2 = "Wir beide wissen um die Lage, in der Ihr euch befindet. Ich schlage daher folgenden Handel vor: ";
const string Passage_3 = "Ihr erteilt mir und allen meinen Männern Generalabsolution vor Innos und dem König. ";
const string Passage_4 = "Im Gegenzug bieten wir unsere Dienste für die Verteidigung der Stadt und des umliegenden Landes an. ";
const string Passage_5 = "Desweiteren werde ich dafür sorgen, daß meine Männer von den umliegenden Höfen fernbleiben - natürlich mit Ausnahme des Hofes von Onar, auf dem wir weiterhin stationiert bleiben werden.";
const string Passage_6 = "Ich weiß, daß auf dem Schiff, mit dem Ihr zum Festland aubrechen werdet, noch Platz für mich und einige meiner Männer ist. Wenn Ihr in See stecht, will ich an Bord sein.";
const string Passage_7 = "Ich ersuche Euch, trefft Eure Entscheidung mit aller Euch gegebenen Weisheit. ";
const string Passage_8 = "gezeichnet   General Lee";

func void UsePassage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Passage_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Passage_2);
	Doc_PrintLines(nDocID,0,Passage_3);
	Doc_PrintLines(nDocID,0,Passage_4);
	Doc_PrintLines(nDocID,0,Passage_5);
	Doc_PrintLines(nDocID,0,Passage_6);
	Doc_PrintLines(nDocID,0,Passage_7);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Passage_8);
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "Nachricht";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[3] = "";
	text[4] = "";
};


const string BanditLetter_1 = "Haltet alle Männer auf, ";
const string BanditLetter_2 = " die aus den Bergen kommen.";
const string BanditLetter_3 = "Falls jemand den Pass entlangkommt, ";
const string BanditLetter_4 = " ist es wahrscheinlich ein alter Mann.";
const string BanditLetter_5 = "Lasst euch nicht von ihm täuschen - ";
const string BanditLetter_6 = "	er ist ein gefählicher Hexer.	";
const string BanditLetter_7 = "Behaltet den Kerl im Auge";
const string BanditLetter_8 = "Kann gut sein, das der Typ den wir suchen, ";
const string BanditLetter_9 = "	mit ihm Kontakt aufnimmt.	";
const string BanditLetter_10 = "Mit diesem Brief schicke ich euch ";
const string BanditLetter_11 = "	dreissig Goldstücke.	";
const string BanditLetter_12 = "Nochmal dreissig bekommt derjenige, ";
const string BanditLetter_13 = "	der den Mann tötet.	";
const string BanditLetter_14 = "Bringt seinen Kopf zur alten Mine, beim Großbauer.";
const string BanditLetter_15 = "D.";

func void UseBanditLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,BanditLetter_1);
	Doc_PrintLine(nDocID,0,BanditLetter_2);
	Doc_PrintLine(nDocID,0,BanditLetter_3);
	Doc_PrintLine(nDocID,0,BanditLetter_4);
	Doc_PrintLine(nDocID,0,BanditLetter_5);
	Doc_PrintLine(nDocID,0,BanditLetter_6);
	Doc_PrintLine(nDocID,0,BanditLetter_7);
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,BanditLetter_8);
	Doc_PrintLine(nDocID,0,BanditLetter_9);
	Doc_PrintLine(nDocID,0,BanditLetter_10);
	Doc_PrintLine(nDocID,0,BanditLetter_11);
	Doc_PrintLine(nDocID,0,BanditLetter_12);
	Doc_PrintLine(nDocID,0,BanditLetter_13);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,BanditLetter_14);
	Doc_PrintLine(nDocID,0,"		");
	Doc_PrintLine(nDocID,0,BanditLetter_15);
	Doc_PrintLine(nDocID,0,"		");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "Steckbrief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[3] = "Ein Bild von mir!";
	text[4] = "";
};


func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Gesucht.TGA",0);
	Doc_Show(nDocID);
};


instance ItKe_Bandit(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel";
	text[3] = "gehörte einem Banditen";
};

instance ItMi_BaltramPaket(C_Item)
{
	name = "Baltram's Lieferung";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ein schweres Paket";
	text[3] = "voller guter Sachen";
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "Jagdbogen";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = "Bosper's Jagdbogen";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = "Constantino's Ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01_MIS;
	on_unequip = UnEquip_ItRi_Prot_Point_01_MIS;
	description = "Schutz des Holzes ";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItMi_EddasStatue(C_Item)
{
	name = "Innos Statue";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Innos Herr der Gerechtigkeit ";
	text[3] = "segne und behüte mich";
	text[4] = "auf das mir kein Unheil widerfahre";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_CRYPT_01(C_Item)
{
	name = "Alter Messingschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel vom Skelett in Raum 1";
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = "Alter Messingschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel vom Skelett in Raum 2";
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = "Alter Messingschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel vom Skelett Raum 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name = "Alte Ritterrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 65;
	protection[PROT_MAGIC] = 100;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Valentino(C_Item)
{
	name = "Truhen Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Truhenschlüssel";
	text[3] = "von Valentino";
};

instance ItKe_Buerger(C_Item)
{
	name = "Truhen Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Lag auf einer Fensterbank rum";
	text[3] = "";
};

instance ItKe_Richter(C_Item)
{
	name = "Truhen Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Truhenschlüssel";
	text[3] = "des Richters";
};

instance ItKe_Salandril(C_Item)
{
	name = "Truhen Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "von Salandril dem Alchemisten";
	text[3] = "";
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = "Truhen Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ein kleiner Messingschlüssel";
	text[3] = "aus dem Haus der Paladine";
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ein kleiner Schlüssel";
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ein rostiger Türschlüssel";
	text[3] = "aus der Kanalisation";
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "Schulden Buch";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehmar's Schuldenbuch";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
};


const string SchuldBuch_1 = "Geschäfte und Schulden";
const string SchuldBuch_2 = "Ich Meister Thorben, Schreiner von Khorinis, schulde dem ehrenwerten Herrn Lehmar 200 Goldmünzen";
const string SchuldBuch_3 = "             Thorben";
const string SchuldBuch_4 = "Ich Coragon, Wirt in Khorinis, schulde dem ehrenwerten Herrn Lehmar 150 Goldmünzen";
const string SchuldBuch_5 = "             Coragon";
const string SchuldBuch_6 = "Ich, Hanna, Besitzerin des Hotels in Khorinis, schulde Herrn Lehmar 250 Goldmünzen.";
const string SchuldBuch_7 = "               Hanna";

func void UseSchuldBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,SchuldBuch_1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,SchuldBuch_2);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,SchuldBuch_3);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,SchuldBuch_4);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,SchuldBuch_5);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,SchuldBuch_6);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,SchuldBuch_7);
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name = "Sonnenaloe";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name = "Zimmerschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "der Tarverne ´Zur Toten Harpie´";
	text[3] = "";
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "Dragomir´s Armbrust";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damageTotal = Damage_LeichteArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_LeichteArmbrust;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

