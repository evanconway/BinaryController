/// @description Sets current values of axis as previous, to be used for determining pressed in next update.

sbc_ensureinit();

for (var i = 0; i < array_length_1d(global.sbc_gamepad_axis_prev); i++) 
{
	array_set(global.sbc_gamepad_axis_prev, i, sbc_gamepad_down(i));
}
