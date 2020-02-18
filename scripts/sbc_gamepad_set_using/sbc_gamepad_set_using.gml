/// @description Determine whether gamepad or keyboard is being used. Sets sbc_gamepad_using.

// If no gamepadID has been determined, poll devices to find one.

// check all buttons
if (global.sbc_gamepad_id == undefined) 
{
	for (var i = 0; i < gamepad_get_device_count(); i++) 
	{
		for (var k = 0; k < gamepad_button_count(i); k++) 
		{
			if (gamepad_button_check(i, k)) 
			{
				global.sbc_gamepad_id = i;
				k = gamepad_button_count(i);
				i = gamepad_get_device_count();
				global.sbc_gamepad_using = true;
			}
		}
	}
}

// check all axis, note: gamepad_axis_count(axis) is actually gamepad_axis_count(device)
if (global.sbc_gamepad_id == undefined) {
	for (var i = 0; i < gamepad_get_device_count(); i++) 
	{
		for (var k = 0; k < gamepad_axis_count(i); k++) 
		{
			if (abs(gamepad_axis_value(i, k)) > global.sbc_gamepad_axis_deadzone) 
			{
				global.sbc_gamepad_id = i;
				k = gamepad_axis_count(i);
				i = gamepad_get_device_count();
				global.sbc_gamepad_using = true;
			}
		}
	}
}

// check if using gamepad

// check all buttons
if (global.sbc_gamepad_id != undefined) 
{
	for (var i = 0; i < gamepad_button_count(global.sbc_gamepad_id); i++) 
	{
		if (gamepad_button_check(global.sbc_gamepad_id, i)) 
		{
			global.sbc_gamepad_using = true;
			i = gamepad_button_count(global.sbc_gamepad_id);
		}
	}
}

// check all axis
if (global.sbc_gamepad_id != undefined) 
{
	for (var i = 0; i < gamepad_axis_count(global.sbc_gamepad_id); i++) 
	{
		if (abs(gamepad_axis_value(global.sbc_gamepad_id, i)) > global.sbc_gamepad_axis_deadzone) 
		{
			global.sbc_gamepad_using = true;
			i = gamepad_axis_count(global.sbc_gamepad_id);
		}
	}
}

// check if using keyboard
if (keyboard_check_pressed(vk_anykey)) global.sbc_gamepad_using = false;
