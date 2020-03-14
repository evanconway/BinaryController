/// @description Add new action to sbc_actions map
/// @param action
/// @param sbc_keyboard_enum(optional)
/// @param sbc_gamepad_enum(optional)

sbc_ensureinit();
with (global.simple_binary_controller) 
{
	var _action = argument[0];
	if (ds_map_exists(sbc_actions_prev, _action)) 
	{
		show_debug_message("Simple Binary Controller action already exists!");
		return;
	}
	ds_map_add(sbc_actions_prev, _action, false);
	ds_map_add(sbc_actions_pressed, _action, false);
	ds_map_add(sbc_mappings_keyboard, _action, ds_list_create());
	ds_map_add(sbc_mappings_gamepad, _action, ds_list_create());
	if (argument_count > 1) 
	{
		// check if keyboard bind is already being used
		var _canadd = true;
		for (var act = ds_map_find_first(sbc_actions_prev); act != undefined; act = ds_map_find_next(sbc_actions_prev, act))
		{
			var _mappings = ds_map_find_value(sbc_mappings_keyboard, act);
			for (var i = 0; i < ds_list_size(_mappings); i++)
			{
				if (_mappings[|i] == argument[1]) 
				{
					_canadd = false;
					show_debug_message("Key is already mapped to an action!");
				}
			}
		}
		if (_canadd) ds_list_add(ds_map_find_value(sbc_mappings_keyboard, _action), argument[1]);
	}
	if (argument_count > 2)
	{
		// check if gamepad bind is already being used
		var _canadd = true;
		for (var act = ds_map_find_first(sbc_actions_prev); act != undefined; act = ds_map_find_next(sbc_actions_prev, act))
		{
			var _mappings = ds_map_find_value(sbc_mappings_gamepad, act);
			for (var i = 0; i < ds_list_size(_mappings); i++)
			{
				if (_mappings[|i] == argument[2]) 
				{
					_canadd = false;
					show_debug_message("Button is already mapped to an action!");
				}
			}
		}
		if (_canadd) ds_list_add(ds_map_find_value(sbc_mappings_gamepad, _action), argument[2]);
	}
}
