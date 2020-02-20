/// @description Returns true/false if given action is pressed
/// @param action

sbc_ensureinit();
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_actions_prev, argument[0]))
	{
		show_error("sbc_pressed failed. Action does not exist!", true);
	}
	var _down = sbc_down(argument[0])
	var _down_prev = ds_map_find_value(sbc_actions_prev, argument[0]);
	var _result = false;
	if (_down && !_down_prev) _result = true;
	return _result;
}
