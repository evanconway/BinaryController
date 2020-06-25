/// @description Create the Simple Binary Controller

if (!variable_global_exists("simple_binary_controller") || global.simple_binary_controller == undefined || !instance_exists(global.simple_binary_controller))
{
	global.simple_binary_controller = instance_create_depth(0, 0, 0, o_simple_binary_controller);
}
