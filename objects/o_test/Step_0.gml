/// @description 

var _speed = 2;

if (sbc_down(MOVE_UP)) y -= _speed;
if (sbc_down(MOVE_DOWN)) y += _speed;
if (sbc_down(MOVE_LEFT)) x -= _speed;
if (sbc_down(MOVE_RIGHT)) x += _speed;
if (sbc_pressed(CHANGE)) 
{
	if (sprite_index == s_square) sprite_index = s_square2;
	else sprite_index = s_square;
}