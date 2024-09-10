// File: utils/fn_capitalizeFirstLetter.sqf

/**
 * Capitalizes the first letter of the given string.
 *
 * @exemple _capitalizedString = ["example"] call utils_fnc_capitalizeFirstLetter;
 * @param _str The input string.
 * @return The string with the first letter capitalized.
 */

params ["_str"];

_str = _str splitString "";
_firstLetter = _str select 0;
_firstLetter = toUpper _firstLetter;
_str set [0, _firstLetter];
_str = _str joinString "";
_str