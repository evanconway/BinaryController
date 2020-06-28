/// @description Add key to action mapping for keyboard, returns true if successful
/// @param action
/// @param sbc_keyboard_enum

sbc_initialize();
with (global.simple_binary_controller) 
{
	if (!ds_map_exists(sbc_mappings_keyboard, argument0))
	{
		show_debug_message("sbc_mapping_add_kb failed. Simple Binary Controller action does not exist!");
		return false;
	}
	else
	{
		ds_list_add(sbc_mappings_keyboard[?argument0], argument1);
		return true;
	}
}
