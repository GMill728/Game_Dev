/// @description Draw box and test

draw_self();

draw_set_font(fontNearMythLegends);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);  

var border = 6 * sprite_width / 16;
var box_length = 2 * border;

if (string_width(text) > box_length) 
{
	var ratio = box_length / string_width(text);               
	draw_text_transformed(x + border, y, text, ratio, 1, 0);  
} 
else 
{
	draw_text(x + border, y, text);
}






