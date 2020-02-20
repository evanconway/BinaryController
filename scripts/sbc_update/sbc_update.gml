/// @description Sets all down previous values for Simple Binary Controller

sbc_ensureinit();

// set previous frame values
sbc_gamepad_set_axis_prev();
for (var key = ds_map_find_first(sbc_actions_prev); key != undefined; key = ds_map_find_next(sbc_actions_prev, key)) 
{
	ds_map_set(sbc_actions_prev, key, sbc_down(key));
}
