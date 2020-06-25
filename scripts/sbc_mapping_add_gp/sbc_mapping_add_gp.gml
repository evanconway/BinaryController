/// @description Add button to action mapping for gamepad, returns true if successful
/// @param action
/// @param sbc_gamepad_enum

sbc_initialize();
with (global.simple_binary_controller)
{
	var result = false;
	if (!ds_map_exists(sbc_mappings_gamepad, argument0))
	{
		show_debug_message("sbc_mapping_add_gp failed. Simple Binary Controller action does not exist!");
	}
	else
	{
		ds_list_add(ds_map_find_value(sbc_mappings_gamepad, argument0), argument1);
		result = true;
	}
	return result;
}
