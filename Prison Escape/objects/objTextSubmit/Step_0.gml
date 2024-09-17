/// @description input, delete, store name


if (enabled and focus) {
	
	var inp =  string_letters(keyboard_lastchar); //buffer
	
	//Add input to buffer
	if (keyboard_check(vk_anykey) && string_length(inp)) 
	{
		text += inp;
		keyboard_lastchar = "";
	}
	
	//Delete tap
	if ( keyboard_check_pressed(vk_backspace) && delete_timer == 0) 
	{
		text = string_delete(text, string_length(text), 1);
		delete_timer = 6;
	}
	
	//Delete hold
	if ( keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && delete_timer == 0) 
	{
		text = string_delete(text, string_length(text), 1);
		delete_timer = 2;
	}

	//Update delete timer so not instantly deleting
	if (delete_timer != 0) 
	{
		delete_timer--;	
	}
	
}


