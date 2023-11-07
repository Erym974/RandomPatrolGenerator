//Import from https://forums.bohemia.net/forums/topic/237641-ombra-simple-ied-scriptfunction/
//Author is Ombra_ita but with heavy modification of Patapignouf

//Uncomment following if used as function
//params["_currentObject","_iedIntensity","_isCar"];
//Uncomment following if used as script
_currentObject = _this select 0; _iedIntensity = _this select 1; _isCar = _this select 2;
  
_positionCrater = getPosATL(_currentObject);
_debriesCount = 0;
_exploded = false;

//Add action to defuse
[
	_currentObject, 
	"Defuse the IED", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", 
	"_this distance _target < 3",						// Condition for the action to be shown
	"_caller distance _target < 3",						// Condition for the action to progress
	{
		// Action start code
	}, 
	{
		// Action on going code
	},  
	{
		// Action successfull code
		params ["_object","_caller","_ID","_objectParams","_progress","_maxProgress"];
		
		//Test if the player has engineer skill
		if (_caller getUnitTrait "Engineer") then
		{
			//Tell the player that the IED has been defused
			[1,["The IED has been defused", "PLAIN", 0.5]] remoteExec ["cutText", _caller];

			//Reward the defuse
			[[5], "engine\rankManagement\rankUpdater.sqf"] remoteExec ['BIS_fnc_execVM', 0];
		} else 
		{
			//Explode the IED
			"Land_ShellCrater_01_F" createVehicle (getPos _object);
			"M_Titan_AT" createVehicle (getPos _object)
		};

		//Remove the IED
		deleteVehicle _object;
	}, 
	{
		// Action failed code
	}, 
	[],  
	2,
	0, 
	true, 
	false
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];


while {sleep 1; !_exploded ;} do
{
	//Check if players are around
	{
		if((_x distance _currentObject) < 5) then { _exploded = true; };
	} forEach (allPlayers select {(speed _x) > 10});
	if(_exploded) then
	{
		switch(_iedIntensity) do
		{
			case 1:
			{
				_bombType = "M_Titan_AT" createVehicle (getPos _currentObject);
				soilCrater = "Land_ShellCrater_01_F" createVehicle ([0,0,0]);
				_debriesCount = 3;
			};
			case 2:
			{
				_bombType = "Bo_Mk82" createVehicle (getPos _currentObject);
				soilCrater = "Land_ShellCrater_02_small_F" createVehicle ([0,0,0]);
				_debriesCount = 10;
			};
			case 3:
			{
				_bombType = "IEDLandBig_Remote_Ammo" createVehicle (getPos _currentObject);
				soilCrater = "Land_ShellCrater_02_large_F" createVehicle ([0,0,0]);
				_debriesCount = 15;
			};
		};
		soilCrater setPos _positionCrater;
		//---Keep Car Wreck---
		if(!_isCar) then { deletevehicle _currentObject; }
		else { _currentObject setDamage 1; };
		//---Spawning debries---
		for "_i" from 1 to _debriesCount do
		{
			_distance = [2, _debriesCount] call BIS_fnc_randomInt;
			_direction = [0,359] call BIS_fnc_randomInt;
			_randomPos = [_positionCrater, _distance, _direction] call BIS_fnc_relPos;
			"Land_ShellCrater_02_debris_F" createVehicle _randomPos;
		};
	};
};