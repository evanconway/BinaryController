/// @desc Add button to action mapping for gamepad, returns true if successful.
/// @func sbc_mapping_add_gp(action, sbc_gamepad_enum, *resolve_conflicts)
function sbc_mapping_add_gp(action, sbc_gamepad_enum) {
	sbc_initialize();
	var result = false;
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_mappings_gamepad, action)) {
			show_debug_message("sbc_mapping_add_gp failed. Simple Binary Controller action does not exist!");
		} else {
			// remove mapping from other actions in same group
			if (argument_count < 3 || (!argument[2])) {
				for (var a = ds_map_find_first(sbc_groups); a != undefined; a = ds_map_find_next(sbc_groups, a)) {
					if (sbc_groups[?a] == sbc_groups[?action]) {
						sbc_mapping_remove_gp(a, sbc_gamepad_enum);
					}
				}
			}
			// remove mapping in case it already exists for this action
			sbc_mapping_remove_gp(action, sbc_gamepad_enum);
			ds_list_add(sbc_mappings_gamepad[?action], sbc_gamepad_enum);
			result = true;
		}
	}
	return result;
}

/// @desc Add key to action mapping for keyboard, returns true if successful.
/// @func sbc_mapping_add_kb(action, sbc_keyboard_enum, *resolve_conflicts)
function sbc_mapping_add_kb(action, sbc_keyboard_enum) {
	sbc_initialize();
	var result = false;
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_mappings_keyboard, action)) {
			show_debug_message("sbc_mapping_add_kb failed. Simple Binary Controller action does not exist!");
		} else {
			// remove mapping from other actions in same group
			if (argument_count < 3 || (!argument[2])) {
				for (var a = ds_map_find_first(sbc_groups); a != undefined; a = ds_map_find_next(sbc_groups, a)) {
					if (sbc_groups[?a] == sbc_groups[?action]) {
						sbc_mapping_remove_kb(a, sbc_keyboard_enum);
					}
				}
			}
			// remove mapping in case it already exists for this action
			sbc_mapping_remove_kb(action, sbc_keyboard_enum);
			ds_list_add(sbc_mappings_keyboard[?action], sbc_keyboard_enum);
			result = true;
		}
	}
	return result;
}

/// @desc Get gamepad mappings for given action, returns a ds list.
/// @func sbc_mapping_get_gp(action)
function sbc_mapping_get_gp(action) {
	sbc_initialize();
	var result = undefined;
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_mappings_gamepad, action)) {
			show_debug_message("sbc_mapping_get_gp failed. Simple Binary Controller action does not exist!");
		} else {
			result = sbc_mappings_gamepad[?action];
		}
	}
	return result;
}

/// @desc Get keyboard mappings for given action, returns a ds list.
/// @func sbc_mapping_get_kb(action)
function sbc_mapping_get_kb(action) {
	sbc_initialize();
	var result = undefined;
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_mappings_keyboard, action)) {
			show_debug_message("sbc_mapping_get_kb failed. Simple Binary Controller action does not exist!");
		} else {
			result = sbc_mappings_keyboard[?action];
		}
	}
	return result;
}

/// @desc Remove button from action mapping for gamepad, returns true if successful.
/// @func sbc_mapping_remove_gp(action, sbc_gamepad_enum)
function sbc_mapping_remove_gp(action, sbc_gamepad_enum) {
	sbc_initialize();
	var result = false;
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_mappings_gamepad, action)) {
			show_error("sbc_mapping_remove_gp failed. Simple Binary Controller action does not exist!", true);
		}
		var _list = sbc_mappings_gamepad[?action];
		var _i = ds_list_find_index(_list, sbc_gamepad_enum);
		if (_i >= 0) {
			ds_list_delete(_list, _i);
			result = true;
		}
	}
	return result;
}

/// @desc Remove button from action mapping for keyboard, returns true if successful.
/// @func sbc_mapping_remove_kb(action, sbc_keyboard_enum)
function sbc_mapping_remove_kb(action, sbc_keyboard_enum) {
	sbc_initialize();
	var result = false;
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_mappings_keyboard, action)) {
			show_error("sbc_mapping_remove_kb failed. Simple Binary Controller action does not exist!", true);
		}
		var _list = sbc_mappings_keyboard[?action];
		var _i = ds_list_find_index(_list, sbc_keyboard_enum);
		if (_i >= 0) {
			ds_list_delete(_list, _i);
			result = true;
		}
	}
	return result;
}
