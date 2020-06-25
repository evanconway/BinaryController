/// @description Returns true if given gamepad_enum is pressed.
/// @param sbc_gamepad_enum

sbc_initialize();
with (global.simple_binary_controller)
{
	if (sbc_gamepad_id == undefined) exit;
	switch (argument[0]) 
	{
		// Axis values are assigned to their pressed array value. This array is set in the update script.	
		case SBC_GAMEPAD.LS_UP:
			return sbc_axis_released[SBC_GAMEPAD.LS_UP];
		case SBC_GAMEPAD.LS_DOWN:
			return sbc_axis_released[SBC_GAMEPAD.LS_DOWN];
		case SBC_GAMEPAD.LS_LEFT:
			return sbc_axis_released[SBC_GAMEPAD.LS_LEFT];
		case SBC_GAMEPAD.LS_RIGHT:
			return sbc_axis_released[SBC_GAMEPAD.LS_RIGHT];
		case SBC_GAMEPAD.RS_UP:
			return sbc_axis_released[SBC_GAMEPAD.RS_UP];
		case SBC_GAMEPAD.RS_DOWN:
			return sbc_axis_released[SBC_GAMEPAD.RS_DOWN];
		case SBC_GAMEPAD.RS_LEFT:
			return sbc_axis_released[SBC_GAMEPAD.RS_LEFT];
		case SBC_GAMEPAD.RS_RIGHT:
			return sbc_axis_released[SBC_GAMEPAD.RS_RIGHT];
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
