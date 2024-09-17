/// @description Clicking in and out of box

if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) 
{ //In box
	focus = true;
	image_index = 1;
	text = "";
} 
else 
{ //Out box
	focus = false;
	image_index = 0;
}
