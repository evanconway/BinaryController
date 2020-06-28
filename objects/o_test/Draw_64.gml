/// @description 
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var msg = "Mouse Off";
if (mouse_check_button(mb_left)) msg = "Mouse On";
draw_text(0, 0, msg);
