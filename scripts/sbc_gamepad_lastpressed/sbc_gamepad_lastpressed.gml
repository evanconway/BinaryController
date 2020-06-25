/// @description returns the sbc_gamepad enum of the last button pressed, undefined if nothing pressed
// note that this returns the highest enum button if multiple buttons are pressed
sbc_initialize();
var result = undefined;
// SELECT is the final element in the enum
for (var i = 0; i <= SBC_GAMEPAD.SELECT; i++) 
{
	if (sbc_gamepad_pressed(i)) result = i;
}
return result;
