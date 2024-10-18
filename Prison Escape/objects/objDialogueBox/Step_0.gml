/// @description Handles the updating the textProgress attribute and handling key and mouse presses

//Update instance variables for mouseX and mouseY, for ease of use
//Since GUI layer mouse tracking utilizes the screen's pixels
//And regular mouse_x and mouse_y uses the game room coordinates 
mouseX = device_mouse_x_to_gui(0);
mouseY = device_mouse_y_to_gui(0);

//Update textProgress attribute if less than the length of the text
if (textProgress <= textLength) {
	textProgress += textSpeed;
}//end if

//If space key is pressed, determine appropriate action for text
if (keyboard_check_pressed(vk_space) ) {
	
	if (textProgress < textLength) 
	{
		textProgress = textLength;  //Fast forward typewriting to display full message
	} 
	else if (choice == false) 
	{
		if (objPlayer.hasWon) {
			room_goto(Credits);
		} else {
			alarm[1] = 1; //Display Actions Menu
		}//end if
	}

	
//If mouse button is within the Dialogue Box and a selection is clicked, then call Alarm for handling Player input
} else if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouseX, mouseY, left, top, right, bottom) ) {
	
	//Ensure valid option is being moused over
	if (selected >= 0) {
		alarm[0] = 1; //Submit selected player action
	}//end if
	
}//end if