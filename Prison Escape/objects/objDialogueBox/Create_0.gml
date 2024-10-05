//Created by Professor Griffen Nye

/*** Positioning Variables ***/

//GUI Dimensions
screenW = window_get_width();  //If these two functions give you issues, call them in Draw GUI event
screenH = window_get_height();

//Box and text margins
margin = 8;
padding = 64;


// Box Dimensions
width = screenW * .8; // Adjust width (can fine-tune this number)
height = screenH / 4;          // Adjust height to be smaller (1/4th the screen height)

// Center the box horizontally
left = (screenW - width) / 2;
right = left + width;

// Position vertically (keep it lower if you want)
bottom = screenH - 20;  // Set a 20-pixel margin from the bottom
top = bottom - height;  // Adjust the top based on the box height

/*** Text Variables ***/
text = " The dungeon cell is dark and dreary, with rough stone walls covered in damp moss.\n" +
       "You raise your hand in front of your eyes and can barely make out your fingers\n" +
	   "The air is musty and smells of mold, with the only sound being the occasional drip of water from the ceiling. \n" + 
	   "\n\nPress spacebar to continue...";
	   
//Text Progress
textSpeed = 0.5;
textProgress = 0;
textLength = string_length(text);

/*** Selection and Options Variables ***/
choice = false;
selected = -1;
options = [];
mouseX = 0;
mouseY = 0;

/// @function setDialogue(dialogueText, choices)
/// @desc Applies new dialogue text and possible user choices to DialogueBox and configures them for display.
/// @param {string} dialogueText Text for the DialogueBox (Always Narrator or NPC lines in my example, but can be used for player lines as well)
/// @param {array} [choices] Array of strings indicating the user's possible choices/responses. Empty (or non-included) argument will proceed with spacebar press.
/// @return {undefined}
function setDialogue(dialogueText, choices = []) {
	
	text = dialogueText; //Set text to new prompt
	selected = -1;       //Clear any previous user selections
	textProgress = 0;    //Reset textProgress
	
	//Setup Dialogue Box based on whether or not user is presented with a choice
	if (array_length(choices) == 0) { //No choices case
		text += "\n\nPress spacebar to continue..."; //Append user instructions
		choice = false;                              //Indicate no choice
		options = [];	                             //Clear previous user options
		
	} else { //Choices case
		choice = true;                                              //Indicate choice present
		options = [];												//Clear options array
		array_copy(options, 0, choices, 0, array_length(choices) ); //Populate new user choices
	}//end if
	
	textLength = string_length(text); //Update length of text prompt
	
}//end setDialogue
