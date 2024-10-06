//Name: DialogueBox
//Desc: Script containing functions for facilitating animation and interaction with the Dialogue Box

/// @function typeText(x, y, text, progress, width)
/// @desc Types the specified text one character at a time to create a typewriter effect
/// @param {real} x The starting x position of the text to be displayed
/// @param {real} y The starting y position of the text to be displayed
/// @param {string} text The text to be displayed
/// @param {real} progress The index of the last char within text to display for this frame
/// @param {real} width The width of the area within the Dialogue Box for text to be displayed in
/// @return {undefined}
function typeText(x, y, text, progress, width) {
	var charX = 0;  //x position of current char
	var charY = 0;  //y position of current char
	
	//Draw all chars up to the char index denoted by progress
	for(var i = 1; i <= progress; i++) {
		
		var currChar = string_char_at(text, i); //Get the current char to draw from text
		
		if (string_copy(text, i, 3) == "[i]")
		{
			draw_set_font(fontItalic); 
			usingItalic = true; 
			i += 2; 
			continue; 
		}
		
		if (string_copy(text, i, 4) == "[/i]")
		{
			draw_set_font(font8bit); 
			usingItalic = false; 
			i += 3; 
			continue; 
		}
		
		draw_text(x + charX, y + charY, currChar); //Draw the current char at its appropriate position
		
		charX += string_width(currChar); //Increment x position by width of current char to get next x position
		
		//If we reach the end of the line OR
		//The next word would be split between lines OR
		//The current char is a newline, create a line break
		if (charX > width || (currChar == " " && getNextWordWidth(text, i+1) + charX > width || currChar == "\n") ) {
			charY += string_height(currChar); //Increment y position by height of current char
			charX = 0;
		}//end if
		
	}//end for
	
}//end typeText

/// @func getNextWordWidth(text, idx)
/// @desc Returns the width in pixels of the next word in the text, pointed to by idx
/// @param {string} text The string containing the text to be displayed
/// @param {real} idx The idnex of the first char in the word to be measured
/// @return {real} wordWidth The width in pixels of the next word in the text
function getNextWordWidth(text, idx) {
	var wordWidth = 0;
	var currChar = "";
	
	//Loop from idx to next space or end of text string
	for(var i = idx; currChar != " " && currChar != "\n" && i <= string_length(text); i++) {
		currChar = string_char_at(text, i);
		wordWidth += string_width(currChar);
	}//end for
	
	return wordWidth;
}//end getNextWordWidth

/// @func getSelected(numOptions, spacing, botTextArea, mouseY)
/// @desc Returns the option that is currently being moused over
/// @param {real} numOptions The number of options presented to the user
/// @param {real} spacing The spacing between each of the options in the DialogueBox
/// @param {real} botTextArea The y coordinate of the bottom text boundary in the DialogueBox
/// @param {real} mouseY The y coordinate of the mouse in relation to the GUI Layer (use device_mouse_y_to_gui(0) )
/// @return {real} The index of the element within options array currently moused over. -1 if none
function getSelected(numOptions, spacing, botTextArea, mouseY) {
	
	//Get the option number the mouse is currently hovering over relative to the bottom of the textbox
	//0 is lowest option visually (and also our last element in the array)
	var optionFromBottom = (botTextArea - mouseY + spacing / 2) div spacing;  //div is GameMaker's keyword for integer division
	
	//Validate optionFromBottom, returning -1 if no options are moused over
	if (optionFromBottom < 0 || optionFromBottom > numOptions - 1) {
		return -1;
	} else {
		//Since we are counting from the bottom, flip value to other side of array to get the true index
		return (numOptions - 1) - optionFromBottom;
	}//end if
	
}//end getSelected;