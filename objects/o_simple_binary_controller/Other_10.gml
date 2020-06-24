/// @description Ensure Init

//If Simple Binary Controller has not been initialized, or is broken, throw error.

var msg = "sbc_ensureinit failed. Simple Binary Controller has not been initialized!";

if (global.simple_binary_controller == undefined)
{
	show_error(msg, true);
}

if (!instance_exists(global.simple_binary_controller)) 
{
	show_error(msg, true);
}
