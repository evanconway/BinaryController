/// @description Sets all values for Simple Binary Controller

sbc_ensureinit();
sbc_gamepad_set_using();
with (global.simple_binary_controller)
{
	// set pressed values for axis
	for (var i = 0; i < array_length_1d(sbc_gamepad_axis_pressed); i++)
	{
		var pressed = (sbc_gamepad_down(i) && !sbc_gamepad_axis_prev[i]) ? true : false;
		sbc_gamepad_axis_pressed[i] = pressed;
	}
	// set previous frame axis values (this will be used the next frame to set the pressed values)
	for (var i = 0; i < array_length_1d(sbc_gamepad_axis_prev); i++) 
	{
		sbc_gamepad_axis_prev[i] = sbc_gamepad_down(i);
	}
	// set pressed values for actions
	for (var act = ds_map_find_first(sbc_actions_prev); act != undefined; act = ds_map_find_next(sbc_actions_prev, act)) 
	{
		var pressed = (sbc_down(act) && ! ds_map_find_value(sbc_actions_prev, act)) ? true : false;
		ds_map_set(sbc_actions_pressed, act, pressed);
	}
	// set previous frame action values (same logic as above)
	for (var act = ds_map_find_first(sbc_actions_prev); act != undefined; act = ds_map_find_next(sbc_actions_prev, act)) 
	{
		ds_map_set(sbc_actions_prev, act, sbc_down(act));
	}
}
