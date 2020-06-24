/// @description Sets all values for Simple Binary Controller

sbc_ensureinit();
sbc_gamepad_determine_using();
with (global.simple_binary_controller)
{
	/*
	The pressed and released values of the axis values are set here. Notice that acis_prevdown is required to
	determine these states. Once they have been determined, the prevdown values are no longer needed and can 
	be set for the next frame.
	*/

	// pressed
	sbc_axis_pressed[SBC_GAMEPAD.LS_UP] = sbc_gamepad_down(SBC_GAMEPAD.LS_UP) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_UP];
	sbc_axis_pressed[SBC_GAMEPAD.LS_DOWN] = sbc_gamepad_down(SBC_GAMEPAD.LS_DOWN) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_DOWN];
	sbc_axis_pressed[SBC_GAMEPAD.LS_LEFT] = sbc_gamepad_down(SBC_GAMEPAD.LS_LEFT) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_LEFT];
	sbc_axis_pressed[SBC_GAMEPAD.LS_RIGHT] = sbc_gamepad_down(SBC_GAMEPAD.LS_RIGHT) && !sbc_axis_prevdown[SBC_GAMEPAD.LS_RIGHT];
	sbc_axis_pressed[SBC_GAMEPAD.RS_UP] = sbc_gamepad_down(SBC_GAMEPAD.RS_UP) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_UP];
	sbc_axis_pressed[SBC_GAMEPAD.RS_DOWN] = sbc_gamepad_down(SBC_GAMEPAD.RS_DOWN) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_DOWN];
	sbc_axis_pressed[SBC_GAMEPAD.RS_LEFT] = sbc_gamepad_down(SBC_GAMEPAD.RS_LEFT) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_LEFT];
	sbc_axis_pressed[SBC_GAMEPAD.RS_RIGHT] = sbc_gamepad_down(SBC_GAMEPAD.RS_RIGHT) && !sbc_axis_prevdown[SBC_GAMEPAD.RS_RIGHT];

	// released
	sbc_axis_released[SBC_GAMEPAD.LS_UP] = !sbc_gamepad_down(SBC_GAMEPAD.LS_UP) && sbc_axis_prevdown[SBC_GAMEPAD.LS_UP];
	sbc_axis_released[SBC_GAMEPAD.LS_DOWN] = !sbc_gamepad_down(SBC_GAMEPAD.LS_DOWN) && sbc_axis_prevdown[SBC_GAMEPAD.LS_DOWN];
	sbc_axis_released[SBC_GAMEPAD.LS_LEFT] = !sbc_gamepad_down(SBC_GAMEPAD.LS_LEFT) && sbc_axis_prevdown[SBC_GAMEPAD.LS_LEFT];
	sbc_axis_released[SBC_GAMEPAD.LS_RIGHT] = !sbc_gamepad_down(SBC_GAMEPAD.LS_RIGHT) && sbc_axis_prevdown[SBC_GAMEPAD.LS_RIGHT];
	sbc_axis_released[SBC_GAMEPAD.RS_UP] = !sbc_gamepad_down(SBC_GAMEPAD.RS_UP) && sbc_axis_prevdown[SBC_GAMEPAD.RS_UP];
	sbc_axis_released[SBC_GAMEPAD.RS_DOWN] = !sbc_gamepad_down(SBC_GAMEPAD.RS_DOWN) && sbc_axis_prevdown[SBC_GAMEPAD.RS_DOWN];
	sbc_axis_released[SBC_GAMEPAD.RS_LEFT] = !sbc_gamepad_down(SBC_GAMEPAD.RS_LEFT) && sbc_axis_prevdown[SBC_GAMEPAD.RS_LEFT];
	sbc_axis_released[SBC_GAMEPAD.RS_RIGHT] = !sbc_gamepad_down(SBC_GAMEPAD.RS_RIGHT) && sbc_axis_prevdown[SBC_GAMEPAD.RS_RIGHT];

	// prevdown
	sbc_axis_prevdown[SBC_GAMEPAD.LS_UP] = sbc_gamepad_down(SBC_GAMEPAD.LS_UP);
	sbc_axis_prevdown[SBC_GAMEPAD.LS_DOWN] = sbc_gamepad_down(SBC_GAMEPAD.LS_DOWN);
	sbc_axis_prevdown[SBC_GAMEPAD.LS_LEFT] = sbc_gamepad_down(SBC_GAMEPAD.LS_LEFT);
	sbc_axis_prevdown[SBC_GAMEPAD.LS_RIGHT] = sbc_gamepad_down(SBC_GAMEPAD.LS_RIGHT);
	sbc_axis_prevdown[SBC_GAMEPAD.RS_UP] = sbc_gamepad_down(SBC_GAMEPAD.RS_UP);
	sbc_axis_prevdown[SBC_GAMEPAD.RS_DOWN] = sbc_gamepad_down(SBC_GAMEPAD.RS_DOWN);
	sbc_axis_prevdown[SBC_GAMEPAD.RS_LEFT] = sbc_gamepad_down(SBC_GAMEPAD.RS_LEFT);
	sbc_axis_prevdown[SBC_GAMEPAD.RS_RIGHT] = sbc_gamepad_down(SBC_GAMEPAD.RS_RIGHT);

	// The pressed and release values of actions is set the same way.
	for (var act = ds_map_find_first(sbc_actions_pressed); act != undefined; act = ds_map_find_next(sbc_actions_pressed, act)) 
	{
		sbc_actions_pressed[?act] = sbc_down(act) && !sbc_actions_prevdown[?act];
		sbc_actions_released[?act] = !sbc_down(act) && sbc_actions_prevdown[?act];
		sbc_actions_prevdown[?act] = sbc_down(act);
	}
}
