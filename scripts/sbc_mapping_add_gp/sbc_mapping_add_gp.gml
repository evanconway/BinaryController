/// @description Add button to action mapping for gamepad, returns true if successful
/// @param action
/// @param sbc_gamepad_enum
/// @param boolean(resolve_conflicts) set to false to not remove conflict mappings

sbc_initialize();
var result = false;
with (global.simple_binary_controller)
{
	if (!ds_map_exists(sbc_mappings_gamepad, argument0))
	{
		show_debug_message("sbc_mapping_add_gp failed. Simple Binary Controller action does not exist!");
	}
	else
	{
		// remove mapping from other actions in same group
		if (argument_count < 3 || (!argument[2]))
		{
			for (var a = ds_map_find_first(sbc_groups); a != undefined; a = ds_map_find_next(sbc_groups, a))
			{
				if (sbc_groups[?a] == sbc_groups[?argument[0]])
				{
					sbc_mapping_remove_gp(a, argument[1]);
				}
			}
		}
		// remove mapping in case it already exists for this action
		sbc_mapping_remove_gp(argument[0], argument[1]);
		ds_list_add(sbc_mappings_gamepad[?argument0], argument1);
		result = true;
	}
}
return result;
