player setSpeaker "noVoice";

// Rôle variables
bluFaction = missionNamespace getVariable "bluforFaction";
indFaction = missionNamespace getVariable "independentFaction";

// Display variables
_startingXDialog = -0.15;
_dialogWidth = 1.3;
// Bottom buttons variables
_startingPos = _startingXDialog + 0.01;
_buttonWidth = 0.15;
_spacingX = 0.005;

// Functions
_updateCurrentRole = {
	params ["_RcsRoleListDialog"];
	_RcsCurrentRoleTextDialog = _RcsRoleListDialog getVariable "_RcsCurrentRoleTextDialog";
	_RcsCurrentRoleTextDialog ctrlSetStructuredText parseText format ["Your current role: %1", [player getVariable "role"] call utils_fnc_capitalizeFirstLetter];
};

_updateDescription = {
	params ["_RcsRoleListDialog"];
	_RcsCurrentRoleDescriptionTextDialog = _RcsRoleListDialog getVariable "_RcsCurrentRoleDescriptionTextDialog";
	_data = _RcsRoleListDialog lbData (lbCurSel _RcsRoleListDialog);
	_description = [_data] call getClassInformation;
	_playersCount = count allPlayers;
	_playerInThisRole = 0;
	{
		if (_x getVariable "role" == _data) then {
			_playerInThisRole = _playerInThisRole + 1;
		};
	} forEach allPlayers;
	_RcsCurrentRoleDescriptionTextDialog ctrlSetText format ["%1\n\nPlayers count : (%2/%3)", _description, _playerInThisRole, _playersCount];
};

_selectRoleFunction = {
	params ["_RcsRoleListDialog"];

	// Setup arsenal loadout
	_listOfAvalaibleRole = [player call getPlayerFaction] call setupRoleSwitchToList;
	_role = "";
	if ((_RcsRoleListDialog lbData (lbCurSel _RcsRoleListDialog)) in _listOfAvalaibleRole) then {
		_role = (_RcsRoleListDialog lbData (lbCurSel _RcsRoleListDialog));
	} else {
		_role = _listOfAvalaibleRole select 0;
	};

	if ((player getVariable "role") != _role) then {
		[player, player, player call getPlayerFaction, _role, false] call switchToRole;
		[player, player, player call getPlayerFaction] call setupArsenalToItem;

		// hint switch role
		[[format ["%1 has switched to role %2", name player, [player getVariable "role"] call utils_fnc_capitalizeFirstLetter], "arsenal"], 'engine\hintManagement\addCustomHint.sqf'] remoteExec ['BIS_fnc_execVM', -clientOwner];

		_updateDescription = _RcsRoleListDialog getVariable "_updateDescription";
		_updateCurrentRole = _RcsRoleListDialog getVariable "_updateCurrentRole";
		_refreshCustomLoadoutDisplay = _RcsRoleListDialog getVariable "_refreshCustomLoadoutDisplay";

		[_RcsRoleListDialog] call _updateDescription;
		[_RcsRoleListDialog] call _updateCurrentRole;
		[_RcsRoleListDialog] call _refreshCustomLoadoutDisplay;
	};
};

_refreshCustomLoadoutDisplay = {
	params ["_RcsRoleListDialog"];
	_buttonLoad = _RcsRoleListDialog getVariable "_RcsLoadLoadoutButton";
	_loadableLoadout = profileNamespace getVariable [format [loadoutSaveName, name player, player call getPlayerFaction, player getVariable "role"], []];
	if (count _loadableLoadout == 0) then {
		_buttonLoad ctrlShow false;
	} else {
		_buttonLoad ctrlShow true;
	};
};

disableSerialization;
_display = (findDisplay 46) createDisplay "RscDisplayEmpty";

_backGround = _display ctrlCreate[ "ctrlStatic", 9740 ];
_backGround ctrlSetPosition[ _startingXDialog, 0, _dialogWidth, 1 ];
_backGround ctrlSetBackgroundColor[0.208, 0.208, 0.208, 1];
_backGround ctrlCommit 0;

_RcsTopBackgroundDialog = _display ctrlCreate ["RscText", -1];
_RcsTopBackgroundDialog ctrlSetPosition[ _startingXDialog, 0, _dialogWidth, 0.02 ];
_RcsTopBackgroundDialog ctrlSetBackgroundColor [1, 0.729, 0.031, 1];
_RcsTopBackgroundDialog ctrlSetTextColor [1, 1, 1, 1];
_RcsTopBackgroundDialog ctrlCommit 0;

_RcsBottomBackgroundDialog = _display ctrlCreate ["RscText", -1];
_RcsBottomBackgroundDialog ctrlSetPosition[ _startingXDialog, 1, _dialogWidth, 0.05 ];
_RcsBottomBackgroundDialog ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
_RcsBottomBackgroundDialog ctrlSetTextColor [1, 1, 1, 1];
_RcsBottomBackgroundDialog ctrlCommit 0;

_RcsTitleDialog = _display ctrlCreate ["RscStructuredText", -1];
_RcsTitleDialog ctrlSetText "Role Selection";
_RcsTitleDialog ctrlSetPosition[ _startingXDialog, 0.03, 0.4, 0.8 ];
_RcsTitleDialog ctrlSetTextColor [1, 1, 1, 1];
_RcsTitleDialog ctrlCommit 0;

_RcsCurrentRoleTextDialog = _display ctrlCreate ["RscStructuredText", -1];
_RcsCurrentRoleTextDialog ctrlSetStructuredText parseText format ["Your current role: %1", [player getVariable "role"] call utils_fnc_capitalizeFirstLetter];
_RcsCurrentRoleTextDialog ctrlSetPosition[ 0.5, 0.03, 0.4, 0.8 ];
_RcsCurrentRoleTextDialog ctrlSetTextColor [1, 1, 1, 1];
_RcsCurrentRoleTextDialog ctrlCommit 0;

_RcsLeftSectionTitleDialog = _display ctrlCreate ["RscStructuredText", -1];
_RcsLeftSectionTitleDialog ctrlSetText "Roles";
_RcsLeftSectionTitleDialog ctrlSetPosition[ _startingXDialog + 0.01, 0.1, (_dialogWidth - 0.1) / 2, 0.05 ];
_RcsLeftSectionTitleDialog ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
_RcsLeftSectionTitleDialog ctrlSetTextColor [1, 1, 1, 1];
_RcsLeftSectionTitleDialog ctrlCommit 0;

_RcsRightSectionTitleDialog = _display ctrlCreate ["RscStructuredText", -1];
_RcsRightSectionTitleDialog ctrlSetText "Description";
_RcsRightSectionTitleDialog ctrlSetPosition[ 0.5, 0.1, (_dialogWidth - 0.1) / 2, 0.05 ];
_RcsRightSectionTitleDialog ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
_RcsRightSectionTitleDialog ctrlSetTextColor [1, 1, 1, 1];
_RcsRightSectionTitleDialog ctrlCommit 0;

_RcsCurrentRoleDescriptionTextDialog = _display ctrlCreate ["RscStructuredText", -1];
_RcsCurrentRoleDescriptionTextDialog ctrlSetPosition[ 0.5, 0.16, (_dialogWidth - 0.1) / 2, 0.76 ];
_RcsCurrentRoleDescriptionTextDialog ctrlCommit 0;

_RcsRoleListDialog = _display ctrlCreate ["RscListbox", -1];
_RcsRoleListDialog ctrlSetPosition[ _startingXDialog + 0.01, 0.16, (_dialogWidth - 0.1) / 2, 0.76 ];
_RcsRoleListDialog ctrlSetBackgroundColor [0, 0, 0, 0];
_RcsRoleListDialog ctrlCommit 0;

_RcsRoleListDialog setVariable ["_RcsCurrentRoleDescriptionTextDialog", _RcsCurrentRoleDescriptionTextDialog];
_RcsRoleListDialog setVariable ["_updateDescription", _updateDescription];
_RcsRoleListDialog setVariable ["_selectRoleFunction", _selectRoleFunction];
_RcsRoleListDialog setVariable ["_updateCurrentRole", _updateCurrentRole];
_RcsRoleListDialog setVariable ["_RcsCurrentRoleTextDialog", _RcsCurrentRoleTextDialog];
_RcsRoleListDialog setVariable ["_refreshCustomLoadoutDisplay", _refreshCustomLoadoutDisplay];

_listOfAvalaibleRole =[];
if (player getVariable "sideBeforeDeath" == "independent") then {
	_listOfAvalaibleRole = [indFaction] call setupRoleSwitchToList;
} else {
	_listOfAvalaibleRole = [bluFaction] call setupRoleSwitchToList;
};

{
	_RcsRoleListDialogIndex = lbSize _RcsRoleListDialog;
	_RcsRoleListDialog lbAdd format ["%1", [_x] call utils_fnc_capitalizeFirstLetter];
	_RcsRoleListDialog lbSetData [_RcsRoleListDialogIndex, _x];
} forEach _listOfAvalaibleRole;

/* When Selection change */
	_RcsRoleListDialog ctrlAddEventHandler ["LBSelChanged", {
		params ["_control", "_lbCurSel"];
		_data = _control lbData _lbCurSel;
		_description = [_data] call getClassInformation;
		_updateDescription = _control getVariable "_updateDescription";
		
		[_control] call _updateDescription;
	}];
	
/* When Double click on list */
	_RcsRoleListDialog ctrlAddEventHandler ["LBDblClick", {
		params ["_control"];
		_selectRoleFunction = _control getVariable "_selectRoleFunction";
		[_control] call _selectRoleFunction;
	}];
	
// select current role in the list
	_RcsRoleListDialog lbSetCurSel (_listOfAvalaibleRole find (player getVariable "role"));
	
/** Bottom Buttons */
	
	_RcsCloseButton = _display ctrlCreate ["RscButton", -1];
	_RcsCloseButton ctrlSetText "Close";
	_RcsCloseButton ctrlSetPosition[ _startingPos, 0.93, _buttonWidth, 0.06 ];
	_RcsCloseButton ctrlSetBackgroundColor [0.4, 0, 0, 1];
	_RcsCloseButton ctrlSetTextColor [1, 1, 1, 1];
	_RcsCloseButton ctrlCommit 0;
	_RcsCloseButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
		_display = ctrlParent _ctrl;
		_display closeDisplay 1;
	}];
	
	_RcsArsenalButton = _display ctrlCreate ["RscButton", -1];
	_RcsArsenalButton ctrlSetText "Arsenal";
	_RcsArsenalButton ctrlSetPosition[_startingPos + (_buttonWidth + _spacingX) * 1, 0.93, _buttonWidth, 0.06 ];
	_RcsArsenalButton ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
	_RcsArsenalButton ctrlSetTextColor [1, 1, 1, 1];
	_RcsArsenalButton ctrlCommit 0;
	_RcsArsenalButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
		
		if (("EnableLoadoutRestriction" call BIS_fnc_getParamValue) == 1) then {
		// open restricted arsenal
			[] execVM 'database\openArsenal.sqf';
		} else {
		// open full arsenal
			if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {
				[player, player, true] call ace_arsenal_fnc_openBox;
			} else {
			// Setup regular arsenal
				["Open", [true]] call BIS_fnc_arsenal;
			};
		};
	}];
	
	_RcsLoadDefaultButton = _display ctrlCreate ["RscButton", -1];
	_RcsLoadDefaultButton ctrlSetText "Load default";
	_RcsLoadDefaultButton ctrlSetPosition[_startingPos + (_buttonWidth + _spacingX) * 2, 0.93, _buttonWidth, 0.06 ];
	_RcsLoadDefaultButton ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
	_RcsLoadDefaultButton ctrlSetTextColor [1, 1, 1, 1];
	_RcsLoadDefaultButton ctrlCommit 0;
	_RcsLoadDefaultButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
		[player, player call getPlayerFaction, true] call doInitializeLoadout;
		player setVariable ["spawnLoadout", getUnitLoadout player];
	}];
	
	_RcsSaveLoadoutButton = _display ctrlCreate ["RscButton", -1];
	_RcsSaveLoadoutButton ctrlSetText "Save loadout";
	_RcsSaveLoadoutButton ctrlSetPosition[_startingPos + (_buttonWidth + _spacingX) * 3, 0.93, _buttonWidth, 0.06 ];
	_RcsSaveLoadoutButton ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
	_RcsSaveLoadoutButton ctrlSetTextColor [1, 1, 1, 1];
	_RcsSaveLoadoutButton ctrlCommit 0;
	_RcsSaveLoadoutButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
		
		if (!ironMan) then {
			player setVariable ["spawnLoadout", getUnitLoadout player];
		};
		
	// Save current loadout
		[player, "personal"] call saveCustomLoadout;
		hint "Loadout saved";
		
	// load default faction stuff in ironMan mode
		if (ironMan) then {
			player setUnitLoadout (player getVariable ["spawnLoadout", []]);
			cutText ["Loadout saved\nLoading default loadout", "PLAIN", 0.3];
		} else {
		// Refresh load button
			[] call refreshCustomLoadoutDisplay;
			cutText ["Loadout saved", "PLAIN", 0.3];
		};
	}];
	
	_RcsLoadLoadoutButton = _display ctrlCreate ["RscButton", -1];
	_RcsLoadLoadoutButton ctrlSetText "Load loadout";
	_RcsLoadLoadoutButton ctrlSetPosition[_startingPos + (_buttonWidth + _spacingX) * 4, 0.93, _buttonWidth, 0.06 ];
	_RcsLoadLoadoutButton ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
	_RcsLoadLoadoutButton ctrlSetTextColor [1, 1, 1, 1];
	_RcsLoadLoadoutButton ctrlCommit 0;
	_RcsLoadLoadoutButton ctrlShow false;
	_RcsRoleListDialog setVariable ["_RcsLoadLoadoutButton", _RcsLoadLoadoutButton];
	[_RcsRoleListDialog] call _refreshCustomLoadoutDisplay;
	_RcsLoadLoadoutButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
	// Save personnal loadout
		_loadableLoadout = profileNamespace getVariable [format [loadoutSaveName, name player, player call getPlayerFaction, player getVariable "role"], player getVariable "spawnLoadout"];
		player setUnitLoadout _loadableLoadout;
		
	// Fix TFAR link 
		if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
			_currentRadios = player call TFAR_fnc_radiosList;
			
			if (count _currentRadios >= 1) then {
			// Remove previously added radio in case where there is already a member with the same radio ID
				_currentRadio = _currentRadios#0;
				player unassignItem _currentRadio;
				player removeItem _currentRadio;
				
			// Search default radio name (TFAR rename player's radio)
				_tempArray = (_currentRadio splitString "_");
				_tempArray resize (count _tempArray-1);
				_radioToAdd = (_tempArray joinString "_");
				
			// Add specific radio
				player addItem _radioToAdd;
				player assignItem _radioToAdd;
			};
		};
		
	// Wipe saved loadout in Ironman mode
		if (ironMan) then {
		// Wipe loadout according to player faction
			[player, "empty"] call saveCustomLoadout;
			cutText ["Loadout loaded\nWipe custom loadout", "PLAIN", 0.3];
		} else {
			cutText ["Loadout loaded", "PLAIN", 0.3];
		};
	}];
	
	_RcsSelectRoleButton = _display ctrlCreate ["RscButton", -1];
	_RcsSelectRoleButton ctrlSetText "Select Role";
	_RcsSelectRoleButton ctrlSetPosition[1 - (_spacingX + 0.04), 0.93, _buttonWidth + 0.03, 0.06 ];
	_RcsSelectRoleButton ctrlSetBackgroundColor [0.133, 0.133, 0.133, 1];
	_RcsSelectRoleButton ctrlSetTextColor [1, 1, 1, 1];
	_RcsSelectRoleButton ctrlCommit 0;
	_RcsSelectRoleButton setVariable ["_RcsRoleListDialog", _RcsRoleListDialog];
	_RcsSelectRoleButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
		_RcsRoleListDialog = _ctrl getVariable "_RcsRoleListDialog";
		_selectRoleFunction = _RcsRoleListDialog getVariable "_selectRoleFunction";
		[_RcsRoleListDialog] call _selectRoleFunction;
	}];