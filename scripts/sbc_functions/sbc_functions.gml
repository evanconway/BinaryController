global.simple_binary_controller = instance_create_depth(0, 0, 0, o_simple_binary_controller);

/// @desc Add new action to sbc_actions map.
/// @func sbc_action_add(action, *group)
function sbc_action_add(action) {
	with (global.simple_binary_controller) {
		if (ds_map_exists(sbc_actions_prevdown, action)) {
			show_debug_message("Simple Binary Controller action already exists!");
			return;
		}
		ds_map_add(sbc_actions_prevdown, action, false);
		ds_map_add(sbc_mappings_keyboard, action, ds_list_create());
		ds_map_add(sbc_mappings_gamepad, action, ds_list_create());
		if (argument_count > 1) ds_map_add(sbc_groups, action, argument[1]);
		else ds_map_add(sbc_groups, action, undefined);
	}
}

/// @desc Determines Gamepad or Keyboard
function sbc_determine_gp_or_kb() {

	// Determine whether gamepad or keyboard is being used. Sets and returns sbc_gamepad_using.
	// True means that the gamepad is being used, false means keyboard is being used.
	with (global.simple_binary_controller) {
		/*
		sbc_gamepad_using is set to undefined in the draw_gui_endstep. If has been defined for 
		this frame, there is no need to run through the logic again. 
		*/
		if (sbc_gamepad_using != undefined) return sbc_gamepad_using;
		// If no gamepadID has been determined, poll devices to find one.
		// check all buttons
		if (sbc_gamepad_id == undefined) {
			for (var i = 0; i < gamepad_get_device_count(); i++) {
				for (var k = 0; k < gamepad_button_count(i); k++) {
					if (gamepad_button_check(i, k)) {
						sbc_gamepad_id = i;
						k = gamepad_button_count(i);
						i = gamepad_get_device_count();
						sbc_gamepad_using = true;
					}
				}
			}
		}
		// check all axis, note: gamepad_axis_count(axis) is actually gamepad_axis_count(device)
		if (sbc_gamepad_id == undefined) {
			for (var i = 0; i < gamepad_get_device_count(); i++) {
				for (var k = 0; k < gamepad_axis_count(i); k++) {
					if (abs(gamepad_axis_value(i, k)) > sbc_deadzone) {
						sbc_gamepad_id = i;
						k = gamepad_axis_count(i);
						i = gamepad_get_device_count();
						sbc_gamepad_using = true;
					}
				}
			}
		}
		// check if using gamepad
		// check all buttons
		if (sbc_gamepad_id != undefined) {
			for (var i = 0; i < gamepad_button_count(sbc_gamepad_id); i++) {
				if (gamepad_button_check(sbc_gamepad_id, i)) {
					sbc_gamepad_using = true;
					i = gamepad_button_count(sbc_gamepad_id);
				}
			}
		}
		// check all axis
		if (sbc_gamepad_id != undefined) {
			for (var i = 0; i < gamepad_axis_count(sbc_gamepad_id); i++) {
				if (abs(gamepad_axis_value(sbc_gamepad_id, i)) > sbc_deadzone) {
					sbc_gamepad_using = true;
					i = gamepad_axis_count(sbc_gamepad_id);
				}
			}
		}
		// check if using keyboard
		if (keyboard_check_pressed(vk_anykey)) sbc_gamepad_using = false;
	}
	return global.simple_binary_controller.sbc_gamepad_using;
}

/// @desc Returns true/false if given action is down.
function sbc_down(action) {
	sbc_determine_gp_or_kb();
	var result = false;
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_actions_prevdown, action)) {
			show_error("sbc_down failed. Action does not exist!", true);
		}
		var _mapping = (sbc_gamepad_using) ? sbc_mappings_gamepad : sbc_mappings_keyboard;
		var _key = action;
		var _buttons = _mapping[?_key]; // buttons is a ds_list
		/*
		Check the status of all buttons mapped to the action. If any of them are down, the action 
		is considered down.
		*/
		for (var i = 0; i < ds_list_size(_buttons); i++) {
			var _button = ds_list_find_value(_buttons, i); // button is an sbc_enum for keyboard or gamepad
			if (sbc_gamepad_using) {
				if (sbc_gamepad_down(_button)) result = true;
			} else {
				if (sbc_keyboard_down(_button)) result = true;
			}
		}
	}
	return result;
}

/// @desc Returns true/false if given action is pressed.
function sbc_pressed(action) {
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_actions_prevdown, action)) {
			show_error("sbc_pressed failed. Action does not exist!", true);
		}
		return sbc_down(action) && !sbc_actions_prevdown[?action];
	}
}

/// @desc Returns true/false if given action is released
function sbc_released(action) {
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_actions_prevdown, action))
		{
			show_error("sbc_released failed. Action does not exist!", true);
		}
		return !sbc_down(action) && sbc_actions_prevdown[?action];
	}
}
