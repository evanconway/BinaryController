/// @description Returns true if given button is pressed.
/// @param button

sbc_ensureinit();

if (global.sbc_gamepad_id == undefined) exit;

var result = false;

// -1: button is not axis
//  0: button is axis, but not down
//  1: button is axis, and is down
var _axison = -1;
		
// switch for just axis
switch (argument[0]) 
{
	case SBC_GAMEPAD.LS_UP:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axislv) < global.sbc_gamepad_deadzone * -1;
	break;
	case SBC_GAMEPAD.LS_DOWN:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axislv) > global.sbc_gamepad_deadzone;
	break;
	case SBC_GAMEPAD.LS_LEFT:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axislh) < global.sbc_gamepad_deadzone * -1;
	break;
	case SBC_GAMEPAD.LS_RIGHT:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axislh) > global.sbc_gamepad_deadzone;
	break;
	case SBC_GAMEPAD.RS_UP:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axisrv) < global.sbc_gamepad_deadzone * -1;
	break;
	case SBC_GAMEPAD.RS_DOWN:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axisrv) > global.sbc_gamepad_deadzone;
	break;
	case SBC_GAMEPAD.RS_LEFT:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axisrh) < global.sbc_gamepad_deadzone * -1;
	break;
	case SBC_GAMEPAD.RS_RIGHT:
		_axison = gamepad_axis_value(global.sbc_gamepad_id, gp_axisrh) > global.sbc_gamepad_deadzone;
	break;
}

if (_axison > 0 && !array_get(global.sbc_gamepad_axis_prev, argument[0])) result = true;

switch (argument[0]) 
{
	case SBC_GAMEPAD.DP_UP:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_padu);
	break;
	case SBC_GAMEPAD.DP_DOWN:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_padd);
	break;
	case SBC_GAMEPAD.DP_LEFT:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_padl);
	break;
	case SBC_GAMEPAD.DP_RIGHT:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_padr);
	break;
	case SBC_GAMEPAD.FACE1:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_face1);
	break;
	case SBC_GAMEPAD.FACE2:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_face2);
	break;
	case SBC_GAMEPAD.FACE3:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_face3);
	break;
	case SBC_GAMEPAD.FACE4:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_face4);
	break;
	case SBC_GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_shoulderlb);
	break;
	case SBC_GAMEPAD.TRIGGER_R:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_shoulderrb);
	break;
	case SBC_GAMEPAD.BUMPER_L:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_shoulderl);
	break;
	case SBC_GAMEPAD.BUMPER_R:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_shoulderr);
	break;
	case SBC_GAMEPAD.LS_CLICK:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_stickl);
	break;
	case SBC_GAMEPAD.RS_CLICK:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_stickr);
	break;
	case SBC_GAMEPAD.SELECT:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_select);
	break;
	case SBC_GAMEPAD.START:
		result = gamepad_button_check_pressed(global.sbc_gamepad_id, gp_start);
	break;
}

return result;
