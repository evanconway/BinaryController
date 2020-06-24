/// @description Returns true/false if given action is released
/// @param action

sbc_ensureinit();
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_actions_released, argument[0]))
	{
		show_error("sbc_released failed. Action does not exist!", true);
	}
	return ds_map_find_value(sbc_actions_released, argument[0]);
}
