c_leader = "leader";
c_at = "at";
c_rifleman = "rifleman";
c_engineer = "engineer";
c_autorifleman = "autorifleman";
c_marksman = "marksman"; 
c_medic = "medic";
c_grenadier = "grenadier";

//////////////////////////////
////Define civ group data/////
//////////////////////////////

//Russian
civilian_group_Russian = [
	"CUP_C_R_Rocker_03", 
	"CUP_C_R_Villager_01", 
	"CUP_C_R_Woodlander_02"
];

civilian_big_group_Russian = [
	"CUP_C_R_Assistant_01", 
	"CUP_C_R_Bully_02", 
	"CUP_C_R_Bully_03", 
	"CUP_C_R_Citizen_04", 
	"CUP_C_R_Worker_05", 
	"CUP_C_R_Rescuer_01", 
	"CUP_C_R_Policeman_01"
];

civilianTruck_Russian = [
	"C_Truck_02_transport_F"
];

//////////////////////////////
///Define enemy group data////
//////////////////////////////

//Russian
baseEnemyGroup_Russian  = [
	"CUP_O_RU_Soldier_SL_M_EMR_V2", 
	"CUP_O_RU_Soldier_M_EMR_V2", 
	"CUP_O_RU_Soldier_LAT_M_EMR_V2", 
	"CUP_O_RU_Soldier_MG_M_EMR_V2", 
	"CUP_O_RU_Soldier_TL_M_EMR_V2", 
	"CUP_O_RU_Soldier_AR_M_EMR_V2", 
	"CUP_O_RU_Soldier_A_M_EMR_V2", 
	"CUP_O_RU_Soldier_Medic_M_EMR_V2"
];

baseEnemyATGroup_Russian  = [
	"CUP_O_RU_Soldier_TL_M_EMR_V2", 
	"CUP_O_RU_Soldier_AT_M_EMR_V2", 
	"CUP_O_RU_Soldier_AAT_M_EMR_V2",
	"CUP_O_RU_Soldier_AT_M_EMR_V2"
];

baseEnemyDemoGroup_Russian  = [
	"CUP_O_RU_Soldier_TL_M_EMR_V2", 
	"CUP_O_RU_Soldier_HAT_M_EMR_V2", 
	"CUP_O_RU_Soldier_AHAT_M_EMR_V2",
	"CUP_O_RU_Soldier_AHAT_M_EMR_V2"
];

baseEnemyMortarGroup_Russian  = [
	"CUP_O_2b14_82mm_RU_M_MSV",
	"CUP_O_RU_Soldier_MG_M_EMR_V2", 
	"CUP_O_RU_Soldier_TL_M_EMR_V2"
];

baseEnemyVehicleGroup_Russian  = [
	"CUP_O_UAZ_AGS30_RU", 
	"CUP_O_UAZ_MG_RU", 
	"CUP_O_UAZ_Open_RU"
];

baseEnemyLightArmoredVehicleGroup_Russian = [
	"CUP_O_GAZ_Vodnik_KPVT_RU", 
	"CUP_O_GAZ_Vodnik_PK_RU","CUP_O_Ural_ZU23_RU"
];

baseEnemyHeavyArmoredVehicleGroup_Russian = [
	"CUP_O_BMP2_RU", 
	"CUP_O_BTR60_Green_RU", 
	"CUP_O_2S6_RU", 
	"CUP_O_T72_RU", 
	"CUP_O_T90_RU"
];

////////////////////////
//Vehicle management////
////////////////////////

//Russian
bluforUnarmedVehicle_Russian = [
	"CUP_O_UAZ_Unarmed_RU", 
	"CUP_O_GAZ_Vodnik_Unarmed_RU",
	"CUP_O_Kamaz_RU"
];

bluforArmedVehicle_Russian = [
	"CUP_O_GAZ_Vodnik_PK_RU", 
	"CUP_O_UAZ_MG_RU"
];

bluforUnarmedVehicleChopper_Russian = [
	"CUP_O_Mi8AMT_RU"
];


bluforDrone_Russian = [
	"CUP_O_Pchela1T_RU"
];

bluforBoat_Russian = [
	"CUP_O_PBX_RU"
];

////////////////////////
//Loadout management////
////////////////////////

//Russian
listOfRoles_Russian = [c_leader,c_at,c_rifleman,c_engineer,c_autorifleman,c_marksman,c_medic,c_grenadier];

//Russian
loadout_Russian = [		
	[c_leader,"CUP_O_RU_Soldier_TL_Ratnik_Summer"],
	[c_at,"CUP_O_RU_Soldier_HAT_Ratnik_Summer" ],
	[c_rifleman,"CUP_O_RU_Soldier_Ratnik_Summer"],//Default stuff
	[c_engineer,"CUP_O_RU_Soldier_Engineer_Ratnik_Summer"],
	[c_autorifleman,"CUP_O_RU_Soldier_MG_Ratnik_Summer"],
	[c_marksman,"CUP_O_RU_Soldier_Marksman_Ratnik_Summer"],
	[c_medic,[["CUP_arifle_AK74M_1p63","","","CUP_optic_1p63",["CUP_30Rnd_545x39_AK74M_M",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",16],[],""],["CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_rolled_up_gloves_pads",[["ACE_tourniquet",2],["ACE_SpraypaintRed",1],["ACE_morphine",3],["ACE_microDAGR",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_CableTie",4],["ACE_elasticBandage",6],["ACE_Banana",1],["ACE_EarPlugs",2],["ACE_wirecutter",1]]],["CUP_Vest_RUS_6B45_Sh117_Del",[["ACE_WaterBottle",2],["30Rnd_545x39_Mag_Green_F",10,30],["SmokeShellRed",4,1],["CUP_HandGrenade_M67",2,1],["Chemlight_blue",2,1],["30Rnd_9x21_Mag",1,30]]],["B_Kitbag_rgr",[["ACE_tourniquet",10],["ACE_splint",12],["ACE_personalAidKit",1],["ACE_morphine",20],["ACE_epinephrine",12],["ACE_bloodIV_500",12],["ACE_bloodIV",8],["ACE_quikclot",20],["ACE_elasticBandage",40]]],"CUP_H_RUS_6B47_v2_GogglesClosed_Summer","CUP_G_RUS_Balaclava_Ratnik",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter","CUP_NVG_HMNVS_Hide"]], true],
	[c_grenadier,"CUP_O_RU_Soldier_GL_Ratnik_Summer"]
];


////////////////////////
///Weapon management////
////////////////////////

//Russian
rifleList_Russian = [		
	"CUP_arifle_AK12_black_1P87",
	"CUP_arifle_AK74M",
	"CUP_arifle_AKS74U"
];	


//Grenade launcher or weapon with grenade launcher option
grenadeLauncherList_Russian = [		
	"CUP_arifle_AK12_GP34_black"
];

launcherList_Russian = [		
	"CUP_launch_Metis",
	"CUP_PG7VL_M"
];	

autorifleList_Russian = [			
	"CUP_arifle_RPK74M_1p78",
	"CUP_lmg_Pecheneg_PScope"
];	


marksmanrifleList_Russian = [		
	"CUP_srifle_SVD_pso",
	"CUP_srifle_VSSVintorez_pso",
	"CUP_arifle_AS_VAL_VFG_pso_open",
	"CUP_srifle_ksvk",
	"CUP_srifle_SVD_wdl"
];

smgList_Russian = [	
	"hgun_Rook40_F",
	"CUP_arifle_AS_VAL",
	"CUP_sgun_Saiga12K"
];


//////////////////////////
//Attachement management//
//////////////////////////
attachmentShortList_Russian	= [
	"CUP_optic_OKP_7_rail",
	"CUP_optic_1p63",
	"CUP_optic_1P87_RIS",
	"CUP_optic_PechenegScope",
	"CUP_optic_1P87_1P90_BLK",
	"CUP_optic_Kobra",
	"CUP_optic_OKP_7"
];

attachmentLongList_Russian	= [
	"CUP_optic_SB_11_4x20_PM",
	"CUP_optic_SB_11_4x20_PM_pip",
	"CUP_optic_SB_3_12x50_PMII",
	"CUP_optic_SB_3_12x50_PMII_PIP",
	"CUP_optic_LeupoldMk4",
	"CUP_optic_CWS",
	"CUP_optic_CWS_NV",
	"CUP_optic_CWS_NV_RDS",
	"CUP_SVD_camo_g",
	"CUP_optic_PSO_1"
];

////////////////////////
////Items management////
////////////////////////
itemList_Russian = [
	"FirstAidKit",
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"NVGoggles",
	//"B_UavTerminal",
	"Binocular",
	"Rangefinder",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_SpraypaintRed",
	"ACE_CableTie",
	"ACE_DAGR",
	"ACE_WaterBottle",
	"ACE_EarPlugs",
	"ACE_fieldDressing",
	"ACE_packingBandage",
	"ACE_elasticBandage",
	"ACE_tourniquet",
	"ACE_splint",
	"ACE_morphine",
	"ACE_quikclot",
	"ACE_EntrenchingTool",
	"ACE_RangeTable_82mm",
	"ACE_SpraypaintBlack",
	"ACE_SpraypaintBlue",
	"ACE_SpraypaintGreen",
	"ACE_SpraypaintRed",
	"ACE_IR_Strobe_Item",
	"CUP_NVG_1PN138"
];

itemEngineerList_Russian = [
	"ToolKit",
	"MineDetector",
	"ACE_wirecutter", 
	"ACE_Fortify"
];

itemMedicList_Russian = [
	"Medikit",
	"ACE_epinephrine",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
	"ACE_personalAidKit",
	"ACE_surgicalKit"
];



//backpack avalaible for all unit
backPackList_Russian = [
	"CUP_B_AlicePack_Khaki",
	"CUP_O_RUS_Patrol_bag_Summer_Shovel"
];


//Uniform, vest, headgear, avalaible for all unit
uniformList_Russian = [
	"CUP_Vest_RUS_6B45_Sh117",
	"CUP_H_RUS_6B47_v2_GogglesDown_Summer",
	"CUP_RUS_Balaclava_blk",
	"CUP_U_O_RUS_Ratnik_Summer",
	"CUP_H_RUS_6B47_v2_GogglesClosed_Summer",
	"CUP_G_RUS_Balaclava_Ratnik"
];

//Magazine avalaible for all unit
magazineList_Russian = [
];