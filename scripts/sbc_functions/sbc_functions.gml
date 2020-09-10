// custom enums to make adding actions easier/clearer
enum SBC_GAMEPAD 
{
	LS_UP,
	LS_DOWN,
	LS_LEFT,
	LS_RIGHT,
	RS_UP,
	RS_DOWN,
	RS_LEFT,
	RS_RIGHT,
	LS_CLICK,
	RS_CLICK,
	DP_UP,
	DP_DOWN,
	DP_LEFT,
	DP_RIGHT,
	FACE1, // A (xbox)
	FACE2, // B (xbox)
	FACE3, // X (xbox)
	FACE4, // Y (xbox)
	TRIGGER_L,
	TRIGGER_R,
	BUMPER_L,
	BUMPER_R,
	START,
	SELECT,
}

enum SBC_KEYBOARD 
{
	A,
	B,
	C,
	D,
	E,
	F,
	G,
	H,
	I,
	J,
	K,
	L,
	M,
	N,
	O,
	P,
	Q,
	R,
	S,
	T,
	U,
	V,
	W,
	X,
	Y,
	Z,
	ROW_1,
	ROW_2,
	ROW_3,
	ROW_4,
	ROW_5,
	ROW_6,
	ROW_7,
	ROW_8,
	ROW_9,
	ROW_0,
	SPACE,
	ESC,
	BACKSPACE,
	RETURN,
	TAB,
	UP,
	DOWN,
	LEFT,
	RIGHT,
	CONTROLL,
	CONTROLR,
	ALTL,
	ALTR,
	SHIFTL,
	SHIFTR,
	TILDE,
	MINUS,
	PLUS,
	BRACE_OPEN,
	BRACE_CLOSE,
	BACKSLASH,
	COLON,
	QUOTE,
	COMMA,
	PERIOD,
	QMARK,
	INSERT,
	HOME,
	DELETE,
	END,
	PGUP,
	PGDN,
	PAD_1,
	PAD_2,
	PAD_3,
	PAD_4,
	PAD_5,
	PAD_6,
	PAD_7,
	PAD_8,
	PAD_9,
	PAD_0,
	PAD_SUBTRACT,
	PAD_ADD,
	PAD_MULTIPLY,
	PAD_DIVIDE,
	PAD_ENTER,
	PAD_DECIMAL,
	F1,
	F2,
	F3,
	F4,
	F5,
	F6,
	F7,
	F8,
	F9,
	F10,
	F11,
	F12,
	F13,
	F14,
	F15,
	F16,
	F17,
	F18,
	F19,
	F20,
	F21,
	F22,
	F23,
	F24
}

/// @desc Create the Simple Binary Controller if it does not already exist.
function sbc_initialize() {
	// The user does not need to call this script anywhere. Any script that would need it already calls it.
	if (!variable_global_exists("simple_binary_controller") || global.simple_binary_controller == undefined || !instance_exists(global.simple_binary_controller)) {
		global.simple_binary_controller = instance_create_depth(0, 0, 0, o_simple_binary_controller);
		show_debug_message("SBC Created");
	}
}

/// @desc Add new action to sbc_actions map.
/// @func sbc_action_add(action, *group)
function sbc_action_add(action) {
	sbc_initialize();
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
	sbc_initialize();
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
/// @func sbc_down(action)
function sbc_down(action) {
	sbc_initialize();
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
/// @func sbc_pressed(action)
function sbc_pressed(action) {
	sbc_initialize();
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_actions_prevdown, action)) {
			show_error("sbc_pressed failed. Action does not exist!", true);
		}
		return sbc_down(action) && !sbc_actions_prevdown[?action];
	}
}

/// @desc Returns true/false if given action is released
/// @func sbc_released(action)
function sbc_released(action) {
	sbc_initialize();
	with (global.simple_binary_controller) {
		if (!ds_map_exists(sbc_actions_prevdown, action))
		{
			show_error("sbc_released failed. Action does not exist!", true);
		}
		return !sbc_down(action) && sbc_actions_prevdown[?action];
	}
}
