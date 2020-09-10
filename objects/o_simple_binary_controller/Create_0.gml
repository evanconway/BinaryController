// SIMPLE BINARY CONTROLLER
// BY 0rd1n4ry

/*
The Simple Binary Controller (SBC) allows the user to quickly and easily add simple
on/off style inputs to a game. SBC currently supports keyboard input and direct x devices.
*/

sbc_mappings_keyboard = ds_map_create(); // key is action, value is resizable list of key enums
sbc_mappings_gamepad = ds_map_create(); // key is action, value is resizable list of button enums
sbc_gamepad_using = false; // using gamepad or keyboard
sbc_gamepad_id = undefined;
sbc_deadzone = 0.5;

/*
The state of all actions needs to be stored at the end of each frame to be referenced in the next. 
This map doubles as the map that stores all actions added to the controller.
*/
sbc_actions_prevdown = ds_map_create();
sbc_axis_prevdown = array_create(8, false);

/*
Actions are assigned a group when added. Groups are used to allow the same button to have different
uses in different context. Some examples of groups would be: main_menu, gameplay, start_menu. The 
default group is "undefined".
*/
sbc_groups = ds_map_create();
