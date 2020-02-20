/// @description Add new action to sbc_actions map
/// @param action
/// @param keyboard_bind
/// @param gamepad_bind

sbc_ensureinit();

var _action = argument[0];

if (ds_map_exists(global.sbc_actions, _action)) 
{
	show_error("Simple Binary Controller action already exists!", true);
	return;
}

ds_map_add(global.sbc_actions, _action, false);
ds_map_add(global.sbc_actions_prev, _action, false);
ds_map_add(global.sbc_mappings_keyboard, _action, ds_list_create);
ds_map_add(global.sbc_mappings_gamepad, _action, ds_list_create);

if (argument_count > 1) 
{
	ds_list_add(ds_map_find_value(global.sbc_mappings_keyboard, _action), argument[1]);
}

if (argument_count > 2)
{
	ds_list_add(ds_map_find_value(global.sbc_mappings_gamepad, _action), argument[2]);
}
