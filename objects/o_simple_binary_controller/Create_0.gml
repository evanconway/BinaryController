// SIMPLE BINARY CONTROLLER
// BY EVAN CONWAY

// 23rd, June, 2020 huge update about to start!!

/*
The Simple Binary Controller (SBC) allows the user to quickly and easily add simple
on/off style inputs to a game. SBC supports keyboard input and direct x 
devices.

QUICK START GUIDE

sbc_action_add()
Use this script to add an action to the controller. The action parameter in 
this script is used as a key for a map. Therefore, the action can be any data 
type, like a string or an enum, but all actions must be the same data type.

sbc_mapping_add_kb()
sbc_mapping_add_gp()
Buttons can than be mapped to the actions using sbc_mapping_add_kb for keyboard
input, and sbc_mapping_add_gp for gamepad input. The parameters for these scripts 
are the action, and an SBC enum for the desired button or key. SBC uses its own
enums in place of the game maker enums. The script will not work properly if you
try to use a game maker enum in the arguments. 

sbc_down() and sbc_pressed()
Use these scripts to check if 
*/

/*
For both of the maps: an action as the key, and a resizable list as the 
value. This lets us assign multiple inputs to one action.
*/
sbc_mappings_keyboard = ds_map_create();
sbc_mappings_gamepad = ds_map_create();
sbc_gamepad_using = false; // using gamepad or keyboard
sbc_gamepad_id = undefined;
sbc_gamepad_deadzone = 0.5;
sbc_autoupdate = true;

/*
One of the main reasons for creating the SBC is dealing with gamepad axis. In 
order to make the axis a digital input, we store the value of the previous
frames "down" position of the axis, and compare it to the current. Then we
store that result in the axis_pressed map. Both of these values are set during
the update script, which should be called at the beginning of each frame. 

The reason we store the pressed value, instead of only the prev down value, is
to avoid the need for an update script at the beginning and end of each frame.
At the beginning of the frame we need to check if they user is using the keyboard
or a directX gamepad. But if we wanted to use the previous values to determine
pressed, we would have to set those values at the end of the frame. By checking
at the beginning, and storeing the result right away, we only need to call one
update script at the beginning of the frame. 
*/
sbc_gamepad_axis_prev = array_create(8, false);
sbc_gamepad_axis_pressed = array_create(8, false);
// The same logic applies to storing values for actions. 
sbc_actions_prev = ds_map_create();
sbc_actions_pressed = ds_map_create();
/*
Notice that there is no list or map storing the actions. This is because we already
end up storing prev and pressed values for every action. If we every need to iterate
over every action, or check what actions are in the controller, we can simply use
either the prev or pressed map of actions.
*/

// custom enums to make adding actions easier/clearer
enum SBC_GAMEPAD 
{
	LS_UP,
	LS_DOWN,
	LS_LEFT,
	LS_RIGHT,
	RS_UP,
	RS_DOWN,
	RS_LEFT,
	RS_RIGHT,
	LS_CLICK,
	RS_CLICK,
	DP_UP,
	DP_DOWN,
	DP_LEFT,
	DP_RIGHT,
	FACE1, // A (xbox)
	FACE2, // B (xbox)
	FACE3, // X (xbox)
	FACE4, // Y (xbox)
	TRIGGER_R,
	TRIGGER_L,
	BUMPER_R,
	BUMPER_L,
	START,
	SELECT,
}

enum SBC_KEYBOARD 
{
	A,
	B,
	C,
	D,
	E,
	F,
	G,
	H,
	I,
	J,
	K,
	L,
	M,
	N,
	O,
	P,
	Q,
	R,
	S,
	T,
	U,
	V,
	W,
	X,
	Y,
	Z,
	ROW_1,
	ROW_2,
	ROW_3,
	ROW_4,
	ROW_5,
	ROW_6,
	ROW_7,
	ROW_8,
	ROW_9,
	ROW_0,
	SPACE,
	ESC,
	BACKSPACE,
	RETURN,
	TAB,
	UP,
	DOWN,
	LEFT,
	RIGHT,
	CONTROLL,
	CONTROLR,
	ALTL,
	ALTR,
	SHIFTL,
	SHIFTR,
	TILDE,
	MINUS,
	PLUS,
	BRACE_OPEN,
	BRACE_CLOSE,
	BACKSLASH,
	COLON,
	QUOTE,
	COMMA,
	PERIOD,
	QMARK,
	INSERT,
	HOME,
	DELETE,
	END,
	PGUP,
	PGDN,
	PAD_1,
	PAD_2,
	PAD_3,
	PAD_4,
	PAD_5,
	PAD_6,
	PAD_7,
	PAD_8,
	PAD_9,
	PAD_0,
	PAD_SUBTRACT,
	PAD_ADD,
	PAD_MULTIPLY,
	PAD_DIVIDE,
	PAD_ENTER,
	PAD_DECIMAL,
	F1,
	F2,
	F3,
	F4,
	F5,
	F6,
	F7,
	F8,
	F9,
	F10,
	F11,
	F12,
	F13,
	F14,
	F15,
	F16,
	F17,
	F18,
	F19,
	F20,
	F21,
	F22,
	F23,
	F24
}
