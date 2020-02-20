/// @description Add button to action mapping for gamepad
/// @param action
/// @param sbc_gamepad_enum

sbc_ensureinit();
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_mappings_gamepad, argument0))
	{
		show_error("sbc_mapping_add_gp failed. Simple Binary Controller action does not exist!", true);
	}
	ds_list_add(ds_map_find_value(sbc_mappings_gamepad, argument0), argument1);
}
