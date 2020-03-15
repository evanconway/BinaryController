/// @description Sets whether Simple Binary Controller updates during begin step, or manually.
/// @param boolean

sbc_ensureinit();
with (global.simple_binary_controller) sbc_autoupdate = argument[0];
