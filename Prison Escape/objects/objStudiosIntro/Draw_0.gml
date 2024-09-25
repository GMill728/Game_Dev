/// @description Insert description here
// You can write your code in this editor
draw_set_font(font8bit);
draw_set_alpha(1);
draw_set_color(c_white);


if (display_text = true)
{
	draw_set_alpha(alpha);
	draw_text_transformed(room_width / 2, (room_height / 2) +75, "STUDIOS", 5,5,0);
}
//sets the scale of the text using variables



draw_set_halign(fa_center);
draw_set_valign(fa_middle);

