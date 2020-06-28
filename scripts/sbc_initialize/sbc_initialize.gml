/// @description Create the Simple Binary Controller

// The user does not need to call this script anywhere. Any script that would need it already calls it.

if (!variable_global_exists("simple_binary_controller") || global.simple_binary_controller == undefined || !instance_exists(global.simple_binary_controller))
{
	global.simple_binary_controller = instance_create_depth(0, 0, 0, o_simple_binary_controller);
}
