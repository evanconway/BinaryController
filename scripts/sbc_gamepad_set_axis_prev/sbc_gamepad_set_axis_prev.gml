/// @description Sets current values of axis as previous, to be used for determining pressed in next update.

sbc_ensureinit();
with (global.simple_binary_controller)
{
	for (var i = 0; i < array_length_1d(sbc_gamepad_axis_prev); i++) 
	{
		array_set(sbc_gamepad_axis_prev, i, sbc_gamepad_down(i));
	}
}
