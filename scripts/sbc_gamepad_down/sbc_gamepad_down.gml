/// @description Returns true if given gamepad_enum is down.
/// @param sbc_gamepad_enum

sbc_ensureinit();
var result = false;
with (global.simple_binary_controller)
{
	if (sbc_gamepad_id == undefined) return false;
	// -1: button is not axis
	//  0: button is axis, but not down
	//  1: button is axis, and is down
	var _axison = -1;
		
	// switch for just axis
	switch (argument[0]) 
	{
		case SBC_GAMEPAD.LS_UP:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axislv) < sbc_gamepad_deadzone * -1;
		break;
		case SBC_GAMEPAD.LS_DOWN:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axislv) > sbc_gamepad_deadzone;
		break;
		case SBC_GAMEPAD.LS_LEFT:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axislh) < sbc_gamepad_deadzone * -1;
		break;
		case SBC_GAMEPAD.LS_RIGHT:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axislh) > sbc_gamepad_deadzone;
		break;
		case SBC_GAMEPAD.RS_UP:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axisrv) < sbc_gamepad_deadzone * -1;
		break;
		case SBC_GAMEPAD.RS_DOWN:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axisrv) > sbc_gamepad_deadzone;
		break;
		case SBC_GAMEPAD.RS_LEFT:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axisrh) < sbc_gamepad_deadzone * -1;
		break;
		case SBC_GAMEPAD.RS_RIGHT:
			_axison = gamepad_axis_value(sbc_gamepad_id, gp_axisrh) > sbc_gamepad_deadzone;
		break;
	}
	if (_axison >= 0) result = _axison;

	switch (argument[0]) 
	{
		case SBC_GAMEPAD.DP_UP:
			result = gamepad_button_check(sbc_gamepad_id, gp_padu);
		break;
		case SBC_GAMEPAD.DP_DOWN:
			result = gamepad_button_check(sbc_gamepad_id, gp_padd);
		break;
		case SBC_GAMEPAD.DP_LEFT:
			result = gamepad_button_check(sbc_gamepad_id, gp_padl);
		break;
		case SBC_GAMEPAD.DP_RIGHT:
			result = gamepad_button_check(sbc_gamepad_id, gp_padr);
		break;
		case SBC_GAMEPAD.FACE1:
			result = gamepad_button_check(sbc_gamepad_id, gp_face1);
		break;
		case SBC_GAMEPAD.FACE2:
			result = gamepad_button_check(sbc_gamepad_id, gp_face2);
		break;
		case SBC_GAMEPAD.FACE3:
			result = gamepad_button_check(sbc_gamepad_id, gp_face3);
		break;
		case SBC_GAMEPAD.FACE4:
			result = gamepad_button_check(sbc_gamepad_id, gp_face4);
		break;
		case SBC_GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
			result = gamepad_button_check(sbc_gamepad_id, gp_shoulderlb);
		break;
		case SBC_GAMEPAD.TRIGGER_R:
			result = gamepad_button_check(sbc_gamepad_id, gp_shoulderrb);
		break;
		case SBC_GAMEPAD.BUMPER_L:
			result = gamepad_button_check(sbc_gamepad_id, gp_shoulderl);
		break;
		case SBC_GAMEPAD.BUMPER_R:
			result = gamepad_button_check(sbc_gamepad_id, gp_shoulderr);
		break;
		case SBC_GAMEPAD.LS_CLICK:
			result = gamepad_button_check(sbc_gamepad_id, gp_stickl);
		break;
		case SBC_GAMEPAD.RS_CLICK:
			result = gamepad_button_check(sbc_gamepad_id, gp_stickr);
		break;
		case SBC_GAMEPAD.SELECT:
			result = gamepad_button_check(sbc_gamepad_id, gp_select);
		break;
		case SBC_GAMEPAD.START:
			result = gamepad_button_check(sbc_gamepad_id, gp_start);
		break;
	}
}
return result;
