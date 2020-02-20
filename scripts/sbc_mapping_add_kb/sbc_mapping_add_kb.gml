/// @description Add button to action mapping for keyboard
/// @param action
/// @param sbc_keybaord_enum

sbc_ensureinit();
with (global.simple_binary_controller) 
{
	if (!ds_map_exists(sbc_mappings_keyboard, argument0))
	{
		show_error("sbc_mapping_add_kb failed. Simple Binary Controller action does not exist!", true);
	}
	ds_list_add(ds_map_find_value(sbc_mappings_keyboard, argument0), argument1);
}
