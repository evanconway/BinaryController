///@description Get gamepad mappings for given action, returns a ds list
///@param action

sbc_initialize();
var result = undefined;
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_mappings_gamepad, argument0))
	{
		show_debug_message("sbc_mapping_get_gp failed. Simple Binary Controller action does not exist!");
	}
	else
	{
		result = sbc_mappings_gamepad[?argument0];
	}
}
return result;
