/// @description Sets all down and pressed values for Simple Binary Controller

sbc_ensureinit();

sbc_gamepad_set_using();

var _mapping = (global.sbc_gamepad_using) ? global.sbc_mappings_gamepad : global.sbc_mappings_keyboard;

for (var i = 0; i < ds_list_size(global.sbc_actions); i++) 
{
	if (global.sbc_gamepad_using)
	{
		
	}
	else
	{
		
	}
}
