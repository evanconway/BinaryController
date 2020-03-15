/// @description returns the sbc_keyboard enum of the last key pressed, undefined if no key pressed
// note that this returns the highest enum key if multiple keys are pressed
sbc_ensureinit();
var result = undefined;
// F24 is the final element in the enum
for (var i = 0; i <= SBC_KEYBOARD.F24; i++) 
{
	if (sbc_keyboard_pressed(i)) result = i;
}
return result;
