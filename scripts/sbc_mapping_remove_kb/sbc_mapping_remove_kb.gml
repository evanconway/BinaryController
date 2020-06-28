/// @description Remove button from action mapping for keyboard, returns true if successful
/// @param action
/// @param sbc_keyboard_enum

sbc_initialize();
var result = false;
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_mappings_keyboard, argument0))
	{
		show_error("sbc_mapping_remove_kb failed. Simple Binary Controller action does not exist!", true);
	}
	var _list = sbc_mappings_keyboard[?argument0];
	var _i = ds_list_find_index(_list, argument1);
	if (_i >= 0)
	{
		ds_list_delete(_list, _i);
		result = true;
	}
}
return result;
