/// @description Set Previous Values

for (var i = 0; i < SBC_GAMEPAD.RS_RIGHT; i++)
{
	sbc_axis_prevdown[i] = sbc_gamepad_down(i);
}

for (var act = ds_map_find_first(sbc_actions_prevdown); act != undefined; act = ds_map_find_next(sbc_actions_prevdown, act)) 
{
	sbc_actions_prevdown[?act] = sbc_down(act);
}
