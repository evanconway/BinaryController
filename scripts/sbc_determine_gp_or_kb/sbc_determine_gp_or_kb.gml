/// @description Determine Gamepad or Keyboard

// Determine whether gamepad or keyboard is being used. Sets and returns sbc_gamepad_using.
// True means that the gamepad is being used, false means keyboard is being used.
sbc_initialize();
with (global.simple_binary_controller)
{
	/*
	sbc_gamepad_using is set to undefined in the draw_gui_endstep. If has been defined for 
	this frame, there is no need to run through the logic again. 
	*/
	if (sbc_gamepad_using != undefined) return sbc_gamepad_using;
	// If no gamepadID has been determined, poll devices to find one.
	// check all buttons
	if (sbc_gamepad_id == undefined) 
	{
		for (var i = 0; i < gamepad_get_device_count(); i++) 
		{
			for (var k = 0; k < gamepad_button_count(i); k++) 
			{
				if (gamepad_button_check(i, k)) 
				{
					sbc_gamepad_id = i;
					k = gamepad_button_count(i);
					i = gamepad_get_device_count();
					sbc_gamepad_using = true;
				}
			}
		}
	}
	// check all axis, note: gamepad_axis_count(axis) is actually gamepad_axis_count(device)
	if (sbc_gamepad_id == undefined) {
		for (var i = 0; i < gamepad_get_device_count(); i++) 
		{
			for (var k = 0; k < gamepad_axis_count(i); k++) 
			{
				if (abs(gamepad_axis_value(i, k)) > sbc_deadzone) 
				{
					sbc_gamepad_id = i;
					k = gamepad_axis_count(i);
					i = gamepad_get_device_count();
					sbc_gamepad_using = true;
				}
			}
		}
	}
	// check if using gamepad
	// check all buttons
	if (sbc_gamepad_id != undefined) 
	{
		for (var i = 0; i < gamepad_button_count(sbc_gamepad_id); i++) 
		{
			if (gamepad_button_check(sbc_gamepad_id, i)) 
			{
				sbc_gamepad_using = true;
				i = gamepad_button_count(sbc_gamepad_id);
			}
		}
	}
	// check all axis
	if (sbc_gamepad_id != undefined) 
	{
		for (var i = 0; i < gamepad_axis_count(sbc_gamepad_id); i++) 
		{
			if (abs(gamepad_axis_value(sbc_gamepad_id, i)) > sbc_deadzone) 
			{
				sbc_gamepad_using = true;
				i = gamepad_axis_count(sbc_gamepad_id);
			}
		}
	}
	// check if using keyboard
	if (keyboard_check_pressed(vk_anykey)) sbc_gamepad_using = false;
}
return global.simple_binary_controller.sbc_gamepad_using;
