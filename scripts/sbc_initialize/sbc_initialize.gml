/// @description Initializes global variables for Simple Binary Controller

/*
The actions map stores the "down", and "pressed" state of all actions. The key
for the map is the name of the action. This value can be any type the user chooses,
like string or an enumerator. The value of the map is a 2 length array, the 0 index
stores the down state, and the 1 index stores the pressed state. 
*/
global.sbc_actions = ds_map_create();
/*
Both of the mapping maps use an action as the key, and a resizable list as the 
value. This lets us assign multiple inputs to one action.
*/
global.sbc_mappings_keyboard = ds_map_create();
global.sbc_mappings_gamepad = ds_map_create();

global.sbc_usinggamepad = false;
