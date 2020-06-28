/// @description Add new action to sbc_actions map
/// @param action
/// @param *optional*group

sbc_initialize();
with (global.simple_binary_controller)
{
	if (ds_map_exists(sbc_actions_prevdown, argument[0]))
	{
		show_debug_message("Simple Binary Controller action already exists!");
		return;
	}
	ds_map_add(sbc_actions_prevdown, argument[0], false);
	ds_map_add(sbc_mappings_keyboard, argument[0], ds_list_create());
	ds_map_add(sbc_mappings_gamepad, argument[0], ds_list_create());
	if (argument_count > 1) ds_map_add(sbc_groups, argument[0], argument[1]);
	else ds_map_add(sbc_groups, argument[0], undefined);
}
