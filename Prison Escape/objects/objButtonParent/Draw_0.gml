/// @description Draw button with font
//if room_get_name != "MainMenu" {
draw_self();
draw_text(x, y, text);      //Draw the specified text at button (x,y) (center of sprite due to sprite origin point)
//}

draw_set_font(fontButton);
draw_set_color(text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);



////below are main menu only changes
//if (room_get_name == "MainMenu" && display_text = true)
//{
//	draw_set_alpha(alpha);
//}
//	else if (room_get_name == "MainMenu")
//	{
//		alpha = 0;
//	}

	

//if (display_text && alpha < 1) {
//    alpha += fade_speed;
//	//added a fade in 
//}

