/// @description Returns true/false if given action is down
/// @param action

sbc_initialize();
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_actions_pressed, argument[0]))
	{
		show_error("sbc_down failed. Action does not exist!", true);
	}
	var _mapping = (sbc_gamepad_using) ? sbc_mappings_gamepad : sbc_mappings_keyboard;
	var _key = argument[0];
	var _buttons = ds_map_find_value(_mapping, _key); // buttons is a ds_list
	/*
	Check the status of all buttons mapped to the action. If any of them are down, the action 
	is considered down.
	*/
	for (var i = 0; i < ds_list_size(_buttons); i++)
	{
		var _button = ds_list_find_value(_buttons, i); // button is an sbc_enum for keyboard or gamepad
		if (sbc_gamepad_using)
		{
			if (sbc_gamepad_down(_button)) return true;
		}
		else
		{
			if (sbc_keyboard_down(_button)) return true;
		}
	}
}

return false;
