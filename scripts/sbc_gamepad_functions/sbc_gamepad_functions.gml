/// @desc Returns true if given gamepad_enum is down.
/// @func sbc_gamepad_down(sbc_gamepad_enum)
function sbc_gamepad_down(sbc_gamepad_enum) {
	sbc_initialize();
	with (global.simple_binary_controller) {
		if (sbc_gamepad_id == undefined) return false;
		switch (sbc_gamepad_enum) {
			case SBC_GAMEPAD.LS_UP:
				return gamepad_axis_value(sbc_gamepad_id, gp_axislv) < sbc_deadzone * -1;
			case SBC_GAMEPAD.LS_DOWN:
				return gamepad_axis_value(sbc_gamepad_id, gp_axislv) > sbc_deadzone;
			case SBC_GAMEPAD.LS_LEFT:
				return gamepad_axis_value(sbc_gamepad_id, gp_axislh) < sbc_deadzone * -1;
			case SBC_GAMEPAD.LS_RIGHT:
				return gamepad_axis_value(sbc_gamepad_id, gp_axislh) > sbc_deadzone;
			case SBC_GAMEPAD.RS_UP:
				return gamepad_axis_value(sbc_gamepad_id, gp_axisrv) < sbc_deadzone * -1;
			case SBC_GAMEPAD.RS_DOWN:
				return gamepad_axis_value(sbc_gamepad_id, gp_axisrv) > sbc_deadzone;
			case SBC_GAMEPAD.RS_LEFT:
				return gamepad_axis_value(sbc_gamepad_id, gp_axisrh) < sbc_deadzone * -1;
			case SBC_GAMEPAD.RS_RIGHT:
				return gamepad_axis_value(sbc_gamepad_id, gp_axisrh) > sbc_deadzone;
			case SBC_GAMEPAD.LS_CLICK:
				return gamepad_button_check(sbc_gamepad_id, gp_stickl);
			case SBC_GAMEPAD.RS_CLICK:
				return gamepad_button_check(sbc_gamepad_id, gp_stickr);
			case SBC_GAMEPAD.DP_UP:
				return gamepad_button_check(sbc_gamepad_id, gp_padu);
			case SBC_GAMEPAD.DP_DOWN:
				return gamepad_button_check(sbc_gamepad_id, gp_padd);
			case SBC_GAMEPAD.DP_LEFT:
				return gamepad_button_check(sbc_gamepad_id, gp_padl);
			case SBC_GAMEPAD.DP_RIGHT:
				return gamepad_button_check(sbc_gamepad_id, gp_padr);
			case SBC_GAMEPAD.FACE1:
				return gamepad_button_check(sbc_gamepad_id, gp_face1);
			case SBC_GAMEPAD.FACE2:
				return gamepad_button_check(sbc_gamepad_id, gp_face2);
			case SBC_GAMEPAD.FACE3:
				return gamepad_button_check(sbc_gamepad_id, gp_face3);
			case SBC_GAMEPAD.FACE4:
				return gamepad_button_check(sbc_gamepad_id, gp_face4);
			case SBC_GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
				return gamepad_button_check(sbc_gamepad_id, gp_shoulderlb);
			case SBC_GAMEPAD.TRIGGER_R:
				return gamepad_button_check(sbc_gamepad_id, gp_shoulderrb);
			case SBC_GAMEPAD.BUMPER_L:
				return gamepad_button_check(sbc_gamepad_id, gp_shoulderl);
			case SBC_GAMEPAD.BUMPER_R:
				return gamepad_button_check(sbc_gamepad_id, gp_shoulderr);
			case SBC_GAMEPAD.START:
				return gamepad_button_check(sbc_gamepad_id, gp_start);
			case SBC_GAMEPAD.SELECT:
				return gamepad_button_check(sbc_gamepad_id, gp_select);
		}
	}
}

/// @desc Returns the sbc_gamepad enum of the last button pressed, undefined if nothing pressed.
// Note that this returns the highest enum button if multiple buttons are pressed.
/// @func sbc_gamepad_lastpressed()
function sbc_gamepad_lastpressed() {
	sbc_initialize();
	var result = undefined;
	// SELECT is the final element in the enum
	for (var i = 0; i <= SBC_GAMEPAD.SELECT; i++) {
		if (sbc_gamepad_pressed(i)) result = i;
	}
	return result;
}

/// @desc Returns true if given gamepad_enum is pressed.
/// @func sbc_gamepad_pressed(sbc_gamepad_enum)
function sbc_gamepad_pressed(sbc_gamepad_enum) {
	sbc_initialize();
	with (global.simple_binary_controller) {
		if (sbc_gamepad_id == undefined) exit;
		switch (sbc_gamepad_enum) {
			case SBC_GAMEPAD.LS_UP:
				return sbc_gamepad_down(SBC_GAMEPAD.LS_UP) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_UP];
			case SBC_GAMEPAD.LS_DOWN:
				return sbc_gamepad_down(SBC_GAMEPAD.LS_DOWN) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_DOWN];
			case SBC_GAMEPAD.LS_LEFT:
				return sbc_gamepad_down(SBC_GAMEPAD.LS_LEFT) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_LEFT];
			case SBC_GAMEPAD.LS_RIGHT:
				return sbc_gamepad_down(SBC_GAMEPAD.LS_RIGHT) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_RIGHT];
			case SBC_GAMEPAD.RS_UP:
				return sbc_gamepad_down(SBC_GAMEPAD.RS_UP) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_UP];
			case SBC_GAMEPAD.RS_DOWN:
				return sbc_gamepad_down(SBC_GAMEPAD.RS_DOWN) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_DOWN];
			case SBC_GAMEPAD.RS_LEFT:
				return sbc_gamepad_down(SBC_GAMEPAD.RS_LEFT) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_LEFT];
			case SBC_GAMEPAD.RS_RIGHT:
				return sbc_gamepad_down(SBC_GAMEPAD.RS_RIGHT) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_RIGHT];
			case SBC_GAMEPAD.LS_CLICK:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_stickl);
			case SBC_GAMEPAD.RS_CLICK:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_stickr);
			case SBC_GAMEPAD.DP_UP:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_padu);
			case SBC_GAMEPAD.DP_DOWN:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_padd);
			case SBC_GAMEPAD.DP_LEFT:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_padl);
			case SBC_GAMEPAD.DP_RIGHT:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_padr);
			case SBC_GAMEPAD.FACE1:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_face1);
			case SBC_GAMEPAD.FACE2:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_face2);
			case SBC_GAMEPAD.FACE3:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_face3);
			case SBC_GAMEPAD.FACE4:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_face4);
			case SBC_GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderlb);
			case SBC_GAMEPAD.TRIGGER_R:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderrb);
			case SBC_GAMEPAD.BUMPER_L:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderl);
			case SBC_GAMEPAD.BUMPER_R:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderr);
			case SBC_GAMEPAD.START:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_start);
			case SBC_GAMEPAD.SELECT:
				return gamepad_button_check_pressed(sbc_gamepad_id, gp_select);
		}
	}
}

/// @desc Returns true if given gamepad_enum is released.
/// @func sbc_gamepad_released(sbc_gamepad_enum)
function sbc_gamepad_released(sbc_gamepad_enum) {
	sbc_initialize();
	with (global.simple_binary_controller) {
		if (sbc_gamepad_id == undefined) exit;
		switch (sbc_gamepad_enum) {
			case SBC_GAMEPAD.LS_UP:
				return !sbc_gamepad_down(SBC_GAMEPAD.LS_UP) && sbc_axis_prevdown[SBC_GAMEPAD.LS_UP];
			case SBC_GAMEPAD.LS_DOWN:
				return !sbc_gamepad_down(SBC_GAMEPAD.LS_DOWN) && sbc_axis_prevdown[SBC_GAMEPAD.LS_DOWN];
			case SBC_GAMEPAD.LS_LEFT:
				return !sbc_gamepad_down(SBC_GAMEPAD.LS_LEFT) && sbc_axis_prevdown[SBC_GAMEPAD.LS_LEFT];
			case SBC_GAMEPAD.LS_RIGHT:
				return !sbc_gamepad_down(SBC_GAMEPAD.LS_RIGHT) && sbc_axis_prevdown[SBC_GAMEPAD.LS_RIGHT];
			case SBC_GAMEPAD.RS_UP:
				return !sbc_gamepad_down(SBC_GAMEPAD.RS_UP) && sbc_axis_prevdown[SBC_GAMEPAD.RS_UP];
			case SBC_GAMEPAD.RS_DOWN:
				return !sbc_gamepad_down(SBC_GAMEPAD.RS_DOWN) && sbc_axis_prevdown[SBC_GAMEPAD.RS_DOWN];
			case SBC_GAMEPAD.RS_LEFT:
				return !sbc_gamepad_down(SBC_GAMEPAD.RS_LEFT) && sbc_axis_prevdown[SBC_GAMEPAD.RS_LEFT];
			case SBC_GAMEPAD.RS_RIGHT:
				return !sbc_gamepad_down(SBC_GAMEPAD.RS_RIGHT) && sbc_axis_prevdown[SBC_GAMEPAD.RS_RIGHT];
			case SBC_GAMEPAD.LS_CLICK:
				return gamepad_button_check_released(sbc_gamepad_id, gp_stickl);
			case SBC_GAMEPAD.RS_CLICK:
				return gamepad_button_check_released(sbc_gamepad_id, gp_stickr);
			case SBC_GAMEPAD.DP_UP:
				return gamepad_button_check_released(sbc_gamepad_id, gp_padu);
			case SBC_GAMEPAD.DP_DOWN:
				return gamepad_button_check_released(sbc_gamepad_id, gp_padd);
			case SBC_GAMEPAD.DP_LEFT:
				return gamepad_button_check_released(sbc_gamepad_id, gp_padl);
			case SBC_GAMEPAD.DP_RIGHT:
				return gamepad_button_check_released(sbc_gamepad_id, gp_padr);
			case SBC_GAMEPAD.FACE1:
				return gamepad_button_check_released(sbc_gamepad_id, gp_face1);
			case SBC_GAMEPAD.FACE2:
				return gamepad_button_check_released(sbc_gamepad_id, gp_face2);
			case SBC_GAMEPAD.FACE3:
				return gamepad_button_check_released(sbc_gamepad_id, gp_face3);
			case SBC_GAMEPAD.FACE4:
				return gamepad_button_check_released(sbc_gamepad_id, gp_face4);
			case SBC_GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
				return gamepad_button_check_released(sbc_gamepad_id, gp_shoulderlb);
			case SBC_GAMEPAD.TRIGGER_R:
				return gamepad_button_check_released(sbc_gamepad_id, gp_shoulderrb);
			case SBC_GAMEPAD.BUMPER_L:
				return gamepad_button_check_released(sbc_gamepad_id, gp_shoulderl);
			case SBC_GAMEPAD.BUMPER_R:
				return gamepad_button_check_released(sbc_gamepad_id, gp_shoulderr);
			case SBC_GAMEPAD.START:
				return gamepad_button_check_released(sbc_gamepad_id, gp_start);
			case SBC_GAMEPAD.SELECT:
				return gamepad_button_check_released(sbc_gamepad_id, gp_select);
		}
	}
}
