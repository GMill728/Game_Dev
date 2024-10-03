/// @description Handles drawing the Dialogue Box object to the GUI Layer

//NOTE: Draw GUI event draws to the GUI layer, as opposed to regular Draw event, which draws to the room
//      The Draw event uses room coordinates to place items, 
//			ie If I move around my room, the objects will move in/out of camera view
//		The Draw event uses GUI coordinates to place items, coordinates are mapped to the window (much like Processing)
//			ie If I move around my room, the objects will stay in place (like a minimap or a HUD)
//      Also, make sure that if you are using a viewport for one room, you enable them for ALL rooms, (including
//      your intro sequence room) and set the viewports to the same size (verying Camera size doesn't matter). If you run into
//      issues where GameMaker ignores your Font size, check that is configured properly


//Draw the Dialogue Box sprite
draw_sprite_stretched(sprDialogueBox, 0, left, top, width, height);

//Set Font Properties
draw_set_font( font8bit);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Draw the text
typeText(left + padding, top + padding, text, textProgress, width - padding * 2);

//Handle display of choices after dialogue is stated
if (textProgress >= textLength && choice) {
	var textY = bottom - padding;         //Start at bottom of the text area
	var lineHeight = string_height("A");  //Calculate lineHeight using DialogueFont
	
	//Set text alignment
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	//Get option user is mousing over (-1 indicates none)
	selected = getSelected(array_length(options), lineHeight * 2, textY, mouseY);
	
	//Draw options on the screen starting from the bottom
	for(var i = array_length(options) - 1; i >= 0; i--) {
		
		//Highlight selected option in yellow
		if (i == selected) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}//end if
		
		//Draw the text for the option
		draw_text(screenW/2, textY, options[i]);
		
		//Update text position for drawing the next option in the list
		textY -= 2 * lineHeight;
	}//end for
	
}//end if