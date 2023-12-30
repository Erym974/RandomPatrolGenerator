params ["_caller","_revealedMode"];

//Get current avalaible info
_revealedMissionEnemyInfo = missionNamespace getVariable ["revealedMissionEnemyInfo",[]];
_MissionEnemyInfo = missionNamespace getVariable ["MissionEnemyInfo",[]];

//Select an avalaible info to reveal
_potentialMissionEnemyInfo = _MissionEnemyInfo - _revealedMissionEnemyInfo;
_infoToReveal = selectRandom _potentialMissionEnemyInfo;
_revealedMissionEnemyInfo pushBack _infoToReveal;
missionNamespace setVariable ["revealedMissionEnemyInfo",_revealedMissionEnemyInfo,true];

//Search info description
_infoName = _infoToReveal select 0;
_infoPos = _infoToReveal select 1;
_infoGroup = _infoToReveal select 2;
_nearestCity = nearestLocations [_infoPos, ["NameLocal","NameVillage","NameCity","NameCityCapital"], 1500] select 0;
_intelCivilianRevelated = ""; //Description when player is talking to a civilian
_intelDocumentRevelated = ""; //Description when player is looting corpse or document
switch (_infoName) do 
{
	case "Mortar":
	{
		_intelCivilianRevelated = format ["This morning i saw a mortar position near %1. I don't know if they are there for you, be careful.",text _nearestCity];
		_intelDocumentRevelated = format ["There is a mortar position on %1.", mapGridPosition _infoPos];
	};
	case "Patrol":
	{
		_intelCivilianRevelated = format ["I've heard there's soldiers patrolling around %1. About %2 men.", text _nearestCity, count units _infoGroup];
		_intelDocumentRevelated = format ["There are %2 men patrolling on position %1.", mapGridPosition _infoPos, count units _infoGroup];
	};
	case "Car":
	{
		_intelCivilianRevelated = format ["I saw a %2 around %1 this morning, be careful...",text _nearestCity, getText (configFile >> "cfgVehicles" >> typeOf (vehicle leader (_infoGroup)) >> "displayName")];
		_intelDocumentRevelated = format ["There is a %2 on position %1.", mapGridPosition _infoPos, getText (configFile >> "cfgVehicles" >> typeOf (vehicle leader (_infoGroup)) >> "displayName")];
	};
	case "LightArmored";
	case "HeavyArmored":
	{
		_intelCivilianRevelated = format ["I saw a armored vehicle around %1, be careful it's dangerous...",text _nearestCity];
		_intelDocumentRevelated = format ["There is a %2 on position %1.", mapGridPosition _infoPos, getText (configFile >> "cfgVehicles" >> typeOf (vehicle leader (_infoGroup)) >> "displayName")];
	};
	case "DefenseFOBInfantry":
	{
		_intelCivilianRevelated = format ["I know there is an enemy base around %1, this location seems dangerous", mapGridPosition _infoPos];
		_intelDocumentRevelated = format ["There is an enemy FOB on position %1.", mapGridPosition _infoPos];
	};
	case "DefenseInfantry":
	{
		_intelCivilianRevelated = format ["I know there is a group of %2 soldiers defending %1, this location seems dangerous",text _nearestCity, count units _infoGroup];
		_intelDocumentRevelated = format ["There are %2 soldiers defending position %1", mapGridPosition _infoPos, count units _infoGroup];
	};
	case "Civilian":
	{
		_intelCivilianRevelated = format ["Be careful, there are civilian in %1. Watch your fire...", text _nearestCity];
		_intelDocumentRevelated = format ["Be careful, there are civilian on position %1. Watch your fire...", mapGridPosition _infoPos];
	};
};

_intelToReveal = "";
if (_revealedMode == "civilianAsking") then 
{
	_intelToReveal = _intelCivilianRevelated;
} else 
{
	_intelToReveal = _intelDocumentRevelated;
};

//Display dialog to the player
cutText [_intelToReveal, "PLAIN", 0.5];

//Create diary entry for the intel 
_intelDiaryAlreadyRevealed = _caller getVariable "diaryIntel";
_allDiaryIntel =  format ["%1 <br/> %2 <br/>", _intelDiaryAlreadyRevealed, _intelToReveal];
_caller removeDiaryRecord  ["RPG", _intelDiaryAlreadyRevealed]; //Update diary doesn't work very well so delete/create is the only solution
_newIntelDiaryAlreadyRevealed = _caller createDiaryRecord ["RPG", ["RPG intel", _allDiaryIntel]];
_caller setVariable ["diaryIntel", _newIntelDiaryAlreadyRevealed];