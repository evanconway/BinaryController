/// @description If Simple Binary Controller has not been initialized, throw error.

var msg = "sbc_ensureinit failed. Simple Binary Controller has not been initialized!";

if (!ds_exists(global.sbc_actions, ds_type_map)) 
{
	show_error(msg, true);
}

if (!ds_exists(global.sbc_mappings_gamepad, ds_type_map)) 
{
	show_error(msg, true);
}

if (!ds_exists(global.sbc_mappings_keyboard, ds_type_map)) 
{
	show_error(msg, true);
}
