/// @description Sets all down previous values for Simple Binary Controller

sbc_ensureinit();

with (global.simple_binary_controller)
{
	// set pressed values for axis
	for (var i = 0; i < array_length_1d(sbc_gamepad_axis_pressed); i++)
	{
		sbc_gamepad_axis_pressed[|i] = (sbc_gamepad_down(i) && !sbc_gamepad_axis_prev[|i]) ? true : false;
	}
	// set previous frame axis values
	for (var i = 0; i < array_length_1d(sbc_gamepad_axis_prev); i++) 
	{
		array_set(sbc_gamepad_axis_prev, i, sbc_gamepad_down(i));
	}
	// set pressed values for actions
	for (var key = ds_map_find_first(sbc_actions_prev); key != undefined; key = ds_map_find_next(sbc_actions_prev, key)) 
	{
		var pressed = (sbc_down(key) && ! ds_map_find_value(sbc_actions_prev, key)) ? true : false;
		ds_map_set(sbc_actions_pressed, key, pressed);
	}
	// set previous frame action values
	for (var key = ds_map_find_first(sbc_actions_prev); key != undefined; key = ds_map_find_next(sbc_actions_prev, key)) 
	{
		ds_map_set(sbc_actions_prev, key, sbc_down(key));
	}
}
