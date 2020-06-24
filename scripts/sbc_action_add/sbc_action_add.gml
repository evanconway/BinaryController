/// @description Add new action to sbc_actions map
/// @param action
/// @param *optional*sbc_keyboard_enum
/// @param *optional*sbc_gamepad_enum

sbc_ensureinit();
with (global.simple_binary_controller) 
{
	if (ds_map_exists(sbc_actions_prev, argument[0])) 
	{
		show_debug_message("Simple Binary Controller action already exists!");
		return;
	}
	ds_map_add(sbc_actions_prev, argument[0], false);
	ds_map_add(sbc_actions_pressed, argument[0], false);
	ds_map_add(sbc_mappings_keyboard, argument[0], ds_list_create());
	ds_map_add(sbc_mappings_gamepad, argument[0], ds_list_create());
	if (argument_count > 1) 
	{
		sbc_mapping_add_kb(argument[0], argument[1]);
	}
	if (argument_count > 2)
	{
		sbc_mapping_add_gp(argument[0], argument[2]);
	}
}
