/// @description Add key to action mapping for keyboard, returns true if successful
/// @param action
/// @param sbc_keyboard_enum

sbc_ensureinit();
with (global.simple_binary_controller) 
{
	var result = false;
	if (!ds_map_exists(sbc_mappings_keyboard, argument0))
	{
		show_debug_message("sbc_mapping_add_kb failed. Simple Binary Controller action does not exist!");
	}
	else
	{
		ds_list_add(ds_map_find_value(sbc_mappings_keyboard, argument0), argument1);
		result = true;
	}
	return result;
}
