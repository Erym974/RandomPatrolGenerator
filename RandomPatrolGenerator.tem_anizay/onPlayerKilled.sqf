if (isMultiplayer) then {
	//player setVariable ["respawnLoadout", (getUnitLoadout player)];
	if (("Respawn" call BIS_fnc_getParamValue) == 0) then {
		[player, 0, false] call BIS_fnc_respawnTickets;
		diag_log ([player, 0, true] call BIS_fnc_respawnTickets);
		[missionNamespace, 0] call BIS_fnc_respawnTickets;
		//setPlayerRespawnTime 0;
	};
};

