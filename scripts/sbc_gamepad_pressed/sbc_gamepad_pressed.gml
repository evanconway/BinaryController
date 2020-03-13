/// @description Returns true if given gamepad_enum is pressed.
/// @param sbc_gamepad_enum

sbc_ensureinit();
var result = false;
with (global.simple_binary_controller)
{
	if (sbc_gamepad_id == undefined) exit;
	switch (argument[0]) 
	{
		// Axis values are assigned to their pressed array value. This array is set in the update script.	
		case SBC_GAMEPAD.LS_UP:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.LS_UP] && sbc_gamepad_down(SBC_GAMEPAD.LS_UP);
		break;
		case SBC_GAMEPAD.LS_DOWN:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.LS_DOWN] && sbc_gamepad_down(SBC_GAMEPAD.LS_DOWN);
		break;
		case SBC_GAMEPAD.LS_LEFT:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.LS_LEFT] && sbc_gamepad_down(SBC_GAMEPAD.LS_LEFT);
		break;
		case SBC_GAMEPAD.LS_RIGHT:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.LS_RIGHT] && sbc_gamepad_down(SBC_GAMEPAD.LS_RIGHT);
		break;
		case SBC_GAMEPAD.RS_UP:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.RS_UP] && sbc_gamepad_down(SBC_GAMEPAD.RS_UP);
		break;
		case SBC_GAMEPAD.RS_DOWN:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.RS_DOWN] && sbc_gamepad_down(SBC_GAMEPAD.RS_DOWN);
		break;
		case SBC_GAMEPAD.RS_LEFT:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.RS_LEFT] && sbc_gamepad_down(SBC_GAMEPAD.RS_LEFT);
		break;
		case SBC_GAMEPAD.RS_RIGHT:
			result = sbc_gamepad_axis_prev[SBC_GAMEPAD.RS_RIGHT] && sbc_gamepad_down(SBC_GAMEPAD.RS_RIGHT);
		break;
		// rest of buttons
		case SBC_GAMEPAD.DP_UP:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_padu);
		break;
		case SBC_GAMEPAD.DP_DOWN:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_padd);
		break;
		case SBC_GAMEPAD.DP_LEFT:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_padl);
		break;
		case SBC_GAMEPAD.DP_RIGHT:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_padr);
		break;
		case SBC_GAMEPAD.FACE1:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_face1);
		break;
		case SBC_GAMEPAD.FACE2:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_face2);
		break;
		case SBC_GAMEPAD.FACE3:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_face3);
		break;
		case SBC_GAMEPAD.FACE4:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_face4);
		break;
		case SBC_GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderlb);
		break;
		case SBC_GAMEPAD.TRIGGER_R:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderrb);
		break;
		case SBC_GAMEPAD.BUMPER_L:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderl);
		break;
		case SBC_GAMEPAD.BUMPER_R:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_shoulderr);
		break;
		case SBC_GAMEPAD.LS_CLICK:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_stickl);
		break;
		case SBC_GAMEPAD.RS_CLICK:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_stickr);
		break;
		case SBC_GAMEPAD.SELECT:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_select);
		break;
		case SBC_GAMEPAD.START:
			result = gamepad_button_check_pressed(sbc_gamepad_id, gp_start);
		break;
	}
}
return result;
