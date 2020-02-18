/// @description Add button to action mapping for gamepad
/// @param action
/// @param input

sbc_ensureinit();

if (!ds_map_exists(global.sbc_mappings_gamepad, argument0))
{
	show_error("sbc_mapping_add_gp failed. Simple Binary Controller action does not exist!", true);
}

ds_list_add(ds_map_find_value(global.sbc_mappings_gamepad, argument0), argument1);
