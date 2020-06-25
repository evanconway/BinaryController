/// @description Returns true/false if given action is pressed
/// @param action

sbc_initialize();
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_actions_prevdown, argument[0]))
	{
		show_error("sbc_pressed failed. Action does not exist!", true);
	}
	return sbc_down && !sbc_actions_prevdown[?argument[0]];
}
