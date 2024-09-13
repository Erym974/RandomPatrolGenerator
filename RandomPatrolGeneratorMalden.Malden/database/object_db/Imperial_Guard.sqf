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
	factionInfos pushBack ["_Imperial_Guard", factionID, "Imperial_Guard", true, true, false];
};


// //// ////////////////////////
// /Define enemy group da// // 
// //// ////////////////////////

// Basic enemy group | 8 men (leader, Medic, MG, Sniper, Rifleman)
baseEnemyGroup_Imperial_Guard = [
];

// Basic anti tank enemy group | 5 men max (leader, MG, AT)
baseEnemyATGroup_Imperial_Guard = [
];

// Basic demolition enemy group | 8 men max (leader, Explosive)
baseEnemyDemoGroup_Imperial_Guard = [
];

// Basic Mortar enemy group | 8 men max (Mortar, Rifleman)
baseEnemyMortarGroup_Imperial_Guard = [
];

// Basic enemy vehicle avalaible (light) must be destroyed without AT (ex : jeep)
baseEnemyVehicleGroup_Imperial_Guard = [

];

// Basic enemy light armored vehicle avalaible must be destroyed without heavy AT (ex : BMP)
baseEnemyLightArmoredVehicleGroup_Imperial_Guard = [

];

// Basic enemy heavy armored vehicle avalaible must be destroyed with other vehicle or heavy AT (ex : tank)
baseEnemyHeavyArmoredVehicleGroup_Imperial_Guard = [

];

// Basic enemy chopper avalaible
baseEnemyUnarmedChopperGroup_Imperial_Guard = [

];

// Basic armed enemy chopper avalaible
baseEnemyArmedChopperGroup_Imperial_Guard = [

];

// Basic enemy aircraft avalaible
baseFixedWingGroup_Imperial_Guard = [

];

// //// //////////////////
// vehicle manageme// // 
// //// //////////////////

// Light vehicle avalaible for blufor : Ex light hummvee, quad
bluforUnarmedVehicle_Imperial_Guard = [];

// Armed vehicle avalaible for blufor : Ex heavy hummvee
bluforArmedVehicle_Imperial_Guard = [];

// Chopper unarmed chopper avalaible for blufor : Ex CH47
bluforUnarmedVehicleChopper_Imperial_Guard = [];

// Chopper used to extract players by support shop
bluforExtractVehicleChopper_Imperial_Guard = [];

// Chopper armed choper avalaible for blufor : Ex AH-Z1
bluforArmedChopper_Imperial_Guard = [];

// Armored vehicle avalaible for blufor : Ex light tank
bluforArmoredVehicle_Imperial_Guard = [];

// Drone vehicle avalaible for blufor
bluforDrone_Imperial_Guard = [
];

// Boat vehicle avalaible for blufor
bluforBoat_Imperial_Guard = [

];

// FixedWing vehicle avalaible for blufor
bluforFixedWing_Imperial_Guard = [

];

// Vehicule able to do HQ features (Loadout management and more)
bluforHQVehicle_Imperial_Guard = [

];

// //// //////////////////
// Loadout manageme// // 
// //// //////////////////

// Two options : 
// - ACE Arsenal : [["AMF_Samas_VALO_01_F", "", "", "AMF_Aimpoint_CompM5", ["25Rnd_samas_f1_mag", 25], [], ""], [], ["AMF_Glock_17", "", "", "", ["16Rnd_9x21_Mag", 17], [], ""], ["amf_uniform_02_CE", [["ACE_EarPlugs", 1], ["16Rnd_9x21_Mag", 2, 17]]], ["amf_smb_tlb_famas_grn", [["ACE_MapTools", 1], ["ACE_CableTie", 1], ["25Rnd_samas_f1_mag", 10, 25], ["CUP_HandGrenade_M67", 2, 1], ["SmokeShellBlue", 2, 1], ["SmokeShell", 2, 1]]], [], "AMF_FELIN_MOUNT_EARPROT_OD", "", ["Laserdesignator", "", "", "", ["Laserbatteries", 1], [], ""], ["ItemMap", "ItemGPS", "", "ItemCompass", "TFAR_microdagr", ""]]
// - Game unit : "I_C_Soldier_Bandit_4_F"
loadout_Imperial_Guard = [
	[c_leader, ""],
	[c_at, ""],
	[c_rifleman, ""],
	[c_engineer, ""],
	[c_autorifleman, ""],
	[c_marksman, ""],
	[c_sniper, ""],
	[c_medic, ""],
	[c_radioman, ""],
	[c_grenadier, ""],
	[c_ammobearer, ""],
	[c_pilot, ""]
];

// //// //////////////////
// /Weapon manageme// // 
// //// //////////////////

// Rifle avalaible for all unit
rifleList_Imperial_Guard = [
];

// Grenade launcher or weapon with grenade launcher option
grenadeLauncherList_Imperial_Guard = [
];

// Launcher avalaible for AT
launcherList_Imperial_Guard = [

];

// Autorifle avalaible for autorifleman
autorifleList_Imperial_Guard = [

];

// Rifle avalaible for marksman
marksmanrifleList_Imperial_Guard = [

];

// Smg avalaible for all unit
smgList_Imperial_Guard = [
	
];

// //// ////////////////////
// Attachement managemen// 
// //// ////////////////////

// Short range scope for all unit
attachmentShortList_Imperial_Guard	= [

];

// Long range scope avalaible for marksman
attachmentLongList_Imperial_Guard	= [

];

// //// //////////////////
// // items manageme// // 
// //// //////////////////

// item avalaible for all unit
itemList_Imperial_Guard = [

];

// item avalaible for all engineer
itemEngineerList_Imperial_Guard = [

];

// item avalaible for all medic
itemMedicList_Imperial_Guard = [
];

// backpack avalaible for all unit
backPackList_Imperial_Guard = [
];

// uniform, vest, headgear, avalaible for all unit
uniformList_Imperial_Guard = [
];

// Magazine avalaible for all unit
magazineList_Imperial_Guard = [
];

// default radio for every rifleman
factionDefaultRadios_Imperial_Guard = [

];