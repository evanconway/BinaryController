/// @description Sets whether Simple Binary Controller updates during begin step, or manually.
/// @param boolean

sbc_initialize();
with (global.simple_binary_controller) sbc_autoupdate = argument[0];
