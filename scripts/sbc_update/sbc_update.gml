/// @description Sets all down and pressed values for Simple Binary Controller

sbc_ensureinit();

sbc_gamepad_set_using();

var _mapping = (global.sbc_gamepad_using) ? global.sbc_mappings_gamepad : global.sbc_mappings_keyboard;
for (var key = ds_map_find_first(global.sbc_actions); key != undefined; key = ds_map_find_next(global.sbc_actions, key)) 
{
	var _buttons = ds_map_find_value(_mapping, key); // buttons is a ds_list
	
	/*
	Here we check the status of all buttons mapped to the action. If any of them are down, the action 
	is considered down. For any actions that are down, but were not down the previous frame, the action
	is also set to pressed.
	*/
	var _down = false;
	for (var i = 0; i < ds_list_size(_buttons); i++)
	{
		var _button = ds_list_find_value(_buttons, i); // button is an sbc_enum for keyboard or gamepad
		if (global.sbc_gamepad_using)
		{
			if (sbc_gamepad_down(_button)) _down = true;
		}
		else
		{
			if ()
		}
		
	}
}

sbc_gamepad_set_axis_prev();
for (var key = ds_map_find_first(global.sbc_actions); key != undefined; key = ds_map_find_next(global.sbc_actions, key)) 
{
	var _down = array_get(ds_map_find_value(global.sbc_actions, key), 0);
	ds_map_set(global.sbc_actions_prev, key, _down);
}
