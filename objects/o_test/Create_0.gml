/// @description 

surface_resize(application_surface, 200, 200);
display_set_gui_size(200, 200);
window_set_size(800, 800);
alarm[0] = 1;

// Actions
#macro MOVE_UP "UP"
#macro MOVE_DOWN "DOWN"
#macro MOVE_LEFT "LEFT"
#macro MOVE_RIGHT "RIGHT"
#macro CHANGE "CHANGE"

#macro UI_UP "ui_up"
#macro UI_DOWN "ui_down"
#macro UI_SELECT "ui_select"
#macro UI_CANCEL "ui_cancel"

sbc_action_add(MOVE_UP);
sbc_action_add(MOVE_DOWN);
sbc_action_add(MOVE_LEFT);
sbc_action_add(MOVE_RIGHT);
sbc_action_add(CHANGE);
sbc_action_add(UI_UP, 0);
sbc_action_add(UI_DOWN, 0);
sbc_action_add(UI_SELECT, 0);
sbc_action_add(UI_CANCEL, 0);

sbc_mapping_add_kb(MOVE_UP, SBC_KEYBOARD.UP);
sbc_mapping_add_kb(MOVE_DOWN, SBC_KEYBOARD.DOWN);
sbc_mapping_add_kb(MOVE_LEFT, SBC_KEYBOARD.LEFT);
sbc_mapping_add_kb(MOVE_RIGHT, SBC_KEYBOARD.RIGHT);
sbc_mapping_add_kb(CHANGE, SBC_KEYBOARD.SPACE);

sbc_mapping_add_gp(MOVE_UP, SBC_GAMEPAD.LS_UP);
sbc_mapping_add_gp(MOVE_DOWN, SBC_GAMEPAD.LS_DOWN);
sbc_mapping_add_gp(MOVE_LEFT, SBC_GAMEPAD.LS_LEFT);
sbc_mapping_add_gp(MOVE_RIGHT, SBC_GAMEPAD.LS_RIGHT);
sbc_mapping_add_gp(CHANGE, SBC_GAMEPAD.FACE1);
