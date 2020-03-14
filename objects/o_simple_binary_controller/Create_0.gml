// SIMPLE BINARY CONTROLLER
// BY EVAN CONWAY

/*
The Simple Binary Controller is allows the user to quickly and easily add binary
input to a game. In this context, binary input is an action that is either on,
or off. The Simple Binary Controller works with both keyboard and directX 
input devices. 
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
