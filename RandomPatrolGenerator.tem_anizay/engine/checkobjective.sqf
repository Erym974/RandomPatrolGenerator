_objectivesToTest = _this select 0;
_objectivesDestinationArea = _this select 1;

//Obj management
obj_supply_or_ammo = [];
obj_supply_or_vip = [];
obj_supply = [];
obj_ammo = [];
obj_hvt = [];
obj_vip = [];
obj_list_items = [];
respawnSettings = ["Respawn",1] call BIS_fnc_getParamValue;

//Define current test
current_obj = objNull;

missionComplete = false;
numberOfCompletedObj = 0;
numberOfObjectives = count _objectivesToTest;

mytrigger = createTrigger ["EmptyDetector", getPos _objectivesDestinationArea]; //create a trigger area created at object with variable name my_object
mytrigger setTriggerArea [60, 60, 0, false]; // trigger area with a radius of 100m.
objectReturnedToCity = []; 

if (respawnSettings == 1) then 
{
	[] execVM "engine\respawnSetup.sqf";
};


{
	switch (_x select 1) do
	{
		case "supply":
			{
				obj_supply pushBack (_x select 0);
				obj_supply_or_ammo pushBack (_x select 0);
			};
		case "ammo":
			{
				obj_ammo pushBack (_x select 0);
				obj_supply_or_ammo pushBack (_x select 0);
			};
		case "hvt":
			{
				obj_hvt pushBack (_x select 0);
			};
		case "vip":
			{
				obj_vip pushBack (_x select 0);
			};
		default { hint "default" };
	};
	obj_list_items pushBack (_x select 0);
} foreach _objectivesToTest;

diag_log format ["Objective to test :  %1 in complete list %2", obj_list_items, _objectivesToTest];

while {!missionComplete} do
{
	diag_log format ["Loop to test objective : %1", _objectivesToTest];
	objectReturnedToCity = obj_list_items inAreaArray mytrigger; //vehicles (all vehicles) inAreaArray (Returns list of Objects or Positions that are in the area _mytrigger.)  
    sleep 10;
	{
		current_obj = _x;
		diag_log format ["Currently test objective : %1", current_obj];
		
		switch (current_obj select 1) do
		{
			case "supply":
				{
					if (current_obj select 0 in objectReturnedToCity) then
					{
						diag_log format ["Objective %1 completed !", current_obj select 0 ];
						numberOfCompletedObj = numberOfCompletedObj +1;
						obj_list_items = obj_list_items - [current_obj select 0];
						_objectivesToTest = _objectivesToTest - [current_obj];
						CompletedObjectives pushBack current_obj;
						publicVariable "CompletedObjectives";
						[[format ["L'objectif %1 est terminé", getText (configFile >> "cfgVehicles" >> typeOf (current_obj select 0) >> "displayName")],independent], 'engine\doGenerateMessage.sqf'] remoteExec ['BIS_fnc_execVM', 0];
						if (respawnSettings == 1) then 
						{
							[[], "engine\respawnManager.sqf"] remoteExec ['BIS_fnc_execVM', 0];
						};
					};
				};
			case "ammo":
				{
					if (!alive (current_obj select 0)) then 
					{	
						diag_log format ["Objective %1 completed !", current_obj select 0 ];
						numberOfCompletedObj = numberOfCompletedObj +1;					
						obj_list_items = obj_list_items - [current_obj select 0];
						_objectivesToTest = _objectivesToTest - [current_obj];
						CompletedObjectives pushBack current_obj;
						publicVariable "CompletedObjectives";
						[[format ["L'objectif %1 est terminé", getText (configFile >> "cfgVehicles" >> typeOf (current_obj select 0) >> "displayName")],independent], 'engine\doGenerateMessage.sqf'] remoteExec ['BIS_fnc_execVM', 0];
						if (respawnSettings == 1) then 
						{
							[[], "engine\respawnManager.sqf"] remoteExec ['BIS_fnc_execVM', 0];
						};
					} else 
					{
						if (current_obj select 0 in objectReturnedToCity) then
						{
							diag_log format ["Objective %1 completed !", current_obj select 0 ];
							numberOfCompletedObj = numberOfCompletedObj +1;
							obj_list_items = obj_list_items - [current_obj select 0];
							_objectivesToTest = _objectivesToTest - [current_obj];
							CompletedObjectives pushBack current_obj;
							publicVariable "CompletedObjectives";
							[[format ["L'objectif %1 est terminé", getText (configFile >> "cfgVehicles" >> typeOf (current_obj select 0) >> "displayName")],independent], 'engine\doGenerateMessage.sqf'] remoteExec ['BIS_fnc_execVM', 0];
							if (respawnSettings == 1) then 
							{
								[[], "engine\respawnManager.sqf"] remoteExec ['BIS_fnc_execVM', 0];
							};
						};
					};
				};
			case "hvt":
				{
					if (!alive (current_obj select 0)) then 
					{	
						diag_log format ["Objective %1 completed !", current_obj select 0 ];
						numberOfCompletedObj = numberOfCompletedObj +1;
						obj_list_items = obj_list_items - [current_obj select 0];
						_objectivesToTest = _objectivesToTest - [current_obj];
						CompletedObjectives pushBack current_obj;
						publicVariable "CompletedObjectives";
						[[format ["L'objectif %1 est terminé", getText (configFile >> "cfgVehicles" >> typeOf (current_obj select 0) >> "displayName")],independent], 'engine\doGenerateMessage.sqf'] remoteExec ['BIS_fnc_execVM', 0];
						if (respawnSettings == 1) then 
						{
							[[], "engine\respawnManager.sqf"] remoteExec ['BIS_fnc_execVM', 0];
						};
					};
				};
			case "vip":
				{
					if (current_obj select 0 in objectReturnedToCity) then
					{
						diag_log format ["Objective %1 completed !", current_obj select 0 ];
						numberOfCompletedObj = numberOfCompletedObj +1;
						obj_list_items = obj_list_items - [current_obj select 0];
						_objectivesToTest = _objectivesToTest - [current_obj];
						CompletedObjectives pushBack current_obj;
						publicVariable "CompletedObjectives";
						[[format ["L'objectif %1 est terminé", getText (configFile >> "cfgVehicles" >> typeOf (current_obj select 0) >> "displayName")],independent], 'engine\doGenerateMessage.sqf'] remoteExec ['BIS_fnc_execVM', 0];
						if (respawnSettings == 1) then 
						{
							[[], "engine\respawnManager.sqf"] remoteExec ['BIS_fnc_execVM', 0];
						};
					};
				};
			default { hint "default" };
		};
	} foreach _objectivesToTest;

	missionComplete = numberOfCompletedObj + 1 >= numberOfObjectives;
};

diag_log format ["All objectives completed !"];
if (isMultiplayer) then {
	'OBJ_OK' call BIS_fnc_endMissionServer;
} else {
	'OBJ_OK' call BIS_fnc_endMission;
};

