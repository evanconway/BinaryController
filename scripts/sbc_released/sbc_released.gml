/// @description Returns true/false if given action is released
/// @param action

sbc_initialize();
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_actions_prevdown, argument[0]))
	{
		show_error("sbc_released failed. Action does not exist!", true);
	}
	return !sbc_down(argument[0]) && sbc_actions_prevdown[?argument[0]];
}
