c_leader = "leader";
c_at = "at";
c_rifleman = "rifleman";
c_engineer = "engineer";
c_autorifleman = "autorifleman";
c_marksman = "marksman";
c_sniper = "sniper";
c_medic = "medic";
c_radioman = "radioman";
c_grenadier = "grenadier";
c_ammobearer = "ammobearer";
c_pilot = "pilot";

// faction format :
// [ Number : faction Code, String : faction string name, String : faction name to display, Enabled for blufor/Independant, Enabled for opfor, Enabled for civilian], 
// Add specific factions

if (isClass (configFile >> "CfgPatches" >> "TIOWSpaceMarines")) then {
	factionID = factionID+1;
	factionInfos pushBack ["_Chaos_Warhammer", factionID, "Traitor guards", true, true, false];
};


// //// ////////////////////////
// /Define enemy group da// // 
// //// ////////////////////////

// Basic enemy group | 8 men (leader, Medic, MG, Sniper, Rifleman)
baseEnemyGroup_Chaos_Warhammer = [
	"TIOW_O_Ren_BL_Mil_Lead", // Lead
	"TIOW_O_Ren_BL_Medic", // Medic
	"TIOW_O_Ren_BL_LMG", // MG
	"TIOW_O_Ren_BL_Plasma", // Sniper
	"TIOW_O_Ren_BL_Rifleman" // Rifleman
];

// Basic anti tank enemy group | 5 men max (leader, MG, AT)
baseEnemyATGroup_Chaos_Warhammer = [
	"TIOW_O_Ren_BL_Mil_Lead", // Lead
	"TIOW_O_Ren_BL_Medic", // Medic
	"TIOW_O_Ren_BL_LMG", // MG
	"TIOW_O_Ren_BL_Plasma", // Sniper
	"TIOW_O_Ren_BL_Rifleman" // Rifleman
];

// Basic demolition enemy group | 8 men max (leader, Explosive)
baseEnemyDemoGroup_Chaos_Warhammer = [
	"TIOW_O_Ren_BL_Mil_Lead", // Lead
	"TIOW_O_Ren_BL_Medic", // Medic
	"TIOW_O_Ren_BL_LMG", // MG
	"TIOW_O_Ren_BL_Plasma", // Sniper
	"TIOW_O_Ren_BL_Rifleman" // Rifleman
];

// Basic Mortar enemy group | 8 men max (Mortar, Rifleman)
baseEnemyMortarGroup_Chaos_Warhammer = [
	"TIOW_O_Ren_BL_Mil_Lead", // Lead
	"TIOW_O_Ren_BL_Medic", // Medic
	"TIOW_O_Ren_BL_LMG", // MG
	"TIOW_O_Ren_BL_Plasma", // Sniper
	"TIOW_O_Ren_BL_Rifleman" // Rifleman
];

// Basic enemy vehicle avalaible (light) must be destroyed without AT (ex : jeep)
baseEnemyVehicleGroup_Chaos_Warhammer = [

];

// Basic enemy light armored vehicle avalaible must be destroyed without heavy AT (ex : BMP)
baseEnemyLightArmoredVehicleGroup_Chaos_Warhammer = [

];

// Basic enemy heavy armored vehicle avalaible must be destroyed with other vehicle or heavy AT (ex : tank)
baseEnemyHeavyArmoredVehicleGroup_Chaos_Warhammer = [

];

// Basic enemy chopper avalaible
baseEnemyUnarmedChopperGroup_Chaos_Warhammer = [

];

// Basic armed enemy chopper avalaible
baseEnemyArmedChopperGroup_Chaos_Warhammer = [

];

// Basic enemy aircraft avalaible
baseFixedWingGroup_Chaos_Warhammer = [

];

// //// //////////////////
// vehicle manageme// // 
// //// //////////////////

// Light vehicle avalaible for blufor : Ex light hummvee, quad
bluforUnarmedVehicle_Chaos_Warhammer = [];

// Armed vehicle avalaible for blufor : Ex heavy hummvee
bluforArmedVehicle_Chaos_Warhammer = [];

// Chopper unarmed chopper avalaible for blufor : Ex CH47
bluforUnarmedVehicleChopper_Chaos_Warhammer = [];

// Chopper used to extract players by support shop
bluforExtractVehicleChopper_Chaos_Warhammer = [];

// Chopper armed choper avalaible for blufor : Ex AH-Z1
bluforArmedChopper_Chaos_Warhammer = [];

// Armored vehicle avalaible for blufor : Ex light tank
bluforArmoredVehicle_Chaos_Warhammer = [];

// Drone vehicle avalaible for blufor
bluforDrone_Chaos_Warhammer = [
];

// Boat vehicle avalaible for blufor
bluforBoat_Chaos_Warhammer = [

];

// FixedWing vehicle avalaible for blufor
bluforFixedWing_Chaos_Warhammer = [

];

// Vehicule able to do HQ features (Loadout management and more)
bluforHQVehicle_Chaos_Warhammer = [

];

// //// //////////////////
// Loadout manageme// // 
// //// //////////////////

// Two options : 
// - ACE Arsenal : [["AMF_Samas_VALO_01_F", "", "", "AMF_Aimpoint_CompM5", ["25Rnd_samas_f1_mag", 25], [], ""], [], ["AMF_Glock_17", "", "", "", ["16Rnd_9x21_Mag", 17], [], ""], ["amf_uniform_02_CE", [["ACE_EarPlugs", 1], ["16Rnd_9x21_Mag", 2, 17]]], ["amf_smb_tlb_famas_grn", [["ACE_MapTools", 1], ["ACE_CableTie", 1], ["25Rnd_samas_f1_mag", 10, 25], ["CUP_HandGrenade_M67", 2, 1], ["SmokeShellBlue", 2, 1], ["SmokeShell", 2, 1]]], [], "AMF_FELIN_MOUNT_EARPROT_OD", "", ["Laserdesignator", "", "", "", ["Laserbatteries", 1], [], ""], ["ItemMap", "ItemGPS", "", "ItemCompass", "TFAR_microdagr", ""]]
// - Game unit : "I_C_Soldier_Bandit_4_F"
loadout_Chaos_Warhammer = [
	[c_leader, "TIOW_B_Ren_BL_Mil_Lead"],
	[c_at, "TIOW_B_Ren_BL_ATH"],
	[c_rifleman, "TIOW_B_Ren_BL_Rifleman"],
	[c_engineer, "TIOW_B_Ren_BL_Engineer"],
	[c_autorifleman, "TIOW_B_Ren_BL_LMG"],
	[c_marksman, ""],
	[c_sniper, ""],
	[c_medic, "TIOW_B_Ren_BL_Medic"],
	[c_radioman, "TIOW_B_Ren_BL_Vox"],
	[c_grenadier, "TIOW_B_Ren_BL_Lead"],
	[c_ammobearer, "TIOW_B_Ren_BL_Ammo"],
	[c_pilot, "TIOW_Tactical_BT_7"]
];

// //// //////////////////
// /Weapon manageme// // 
// //// //////////////////

// Rifle avalaible for all unit
rifleList_Chaos_Warhammer = [
	"TIOW_LongLas_836"
];

// Grenade launcher or weapon with grenade launcher option
grenadeLauncherList_Chaos_Warhammer = [
	"TIOW_AgripinaaType2_UGL"
];

// Launcher avalaible for AT
launcherList_Chaos_Warhammer = [

];

// Autorifle avalaible for autorifleman
autorifleList_Chaos_Warhammer = [

];

// Rifle avalaible for marksman
marksmanrifleList_Chaos_Warhammer = [

];

// Smg avalaible for all unit
smgList_Chaos_Warhammer = [
	
];

// //// ////////////////////
// Attachement managemen// 
// //// ////////////////////

// Short range scope for all unit
attachmentShortList_Chaos_Warhammer	= [

];

// Long range scope avalaible for marksman
attachmentLongList_Chaos_Warhammer	= [

];

// //// //////////////////
// // items manageme// // 
// //// //////////////////

// item avalaible for all unit
itemList_Chaos_Warhammer = [

];

// item avalaible for all engineer
itemEngineerList_Chaos_Warhammer = [

];

// item avalaible for all medic
itemMedicList_Chaos_Warhammer = [
];

// backpack avalaible for all unit
backPackList_Chaos_Warhammer = [
];

// uniform, vest, headgear, avalaible for all unit
uniformList_Chaos_Warhammer = [
];

// Magazine avalaible for all unit
magazineList_Chaos_Warhammer = [
];

// default radio for every rifleman
factionDefaultRadios_Chaos_Warhammer = [

];