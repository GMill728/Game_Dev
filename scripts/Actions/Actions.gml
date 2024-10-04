/// @file Handles the Dialogue Branching and game logic for all player actions in a text-based implementation of the game. Script to be deprecated in future version of the game.
/// @author Griffin Nye
//  Date Created: 3/21/24
//  Last Date Modified: 9/22/24

/*** NOTE: This Script will be deprecated once Movement and Collision are implemented, however, is very important for ensuring all of your game logic is mapped out appropriately. ***/

global.actionOptions = ["Open Door", "Inspect Rug", "Approach Prisoner", "Approach Door"];

/// @func displayActionsMenu()
/// @desc Displays the Actions Menu to the player using objDialogueBox
/// @return {undefined}
function displayActionsMenu() {
	objDialogueBox.setDialogue("What would you like to do?", global.actionOptions);
}//end displayActionsMenu

/// @func submitPlayerAction(choice)
/// @desc Handles calling appropriate dialogue branch based on player's selection in objDialogueBox
/// @param {real} choice Index of the option selected by player in objDialogueBox
/// @return {undefined}
function submitPlayerAction(choice) {
	
	//Call appropriate dialogue branch based on player choice
	switch(choice) {
		case 0:
			openDoor();
			break;
		case 1:
			inspectRug();
			break;
		case 2:
			displayPrisonerMenu();
			objPlayer.isTalkingToPrisoner = true;
			break;
		case 3:
			if (global.guardSecretDialogueExhausted)
			{
				handleInnerMonologue(); 
			}
			else 
			{
			displayGuardMenu();
			objPlayer.isTalkingToGuard = true;
			}
			break;
	}//end switch
	
}//end submitPlayerAction

/// @func openDoor()
/// @desc Handles dialogue branch for opening the door. Presents different options based on whether or not user has key.
/// @return {undefined}
function openDoor() {
	
	if (objPlayer.hasKey) {
		objDialogueBox.setDialogue("Congratulations! You have found your way out! Now get back to class!");
		objDialogueBox.alarm[1] = game_get_speed(gamespeed_fps) * 4; //Destroy the objDialogueBox in 4 seconds
	} else {
		objDialogueBox.setDialogue("\"Hmmm... This door seems to be locked\"");
	}//end if
	
}//end openDoor

/// @func openDoor()
/// @desc Handles dialogue branch for inspecting the rug. Presents different options based on whether or not user has received key location from the Watchman.
/// @return {undefined}
function inspectRug() {
	
	if (objPlayer.hasReceivedKeyLocation) {
		objDialogueBox.setDialogue("You lift up the rug to reveal the key! Just as the Watchman had promised.\n\n***You have acquired a key***");
		objPlayer.hasKey = true;
		//NOTE: This only works because all elements after it (talking to Innkeeper and Watchman) are not present in global.actionOptions at this point in the game!
		//      Options for talking to each NPC are removed at the end of their dialogue branches. Player cannot receive key location without finishing both dialogue branches!
		//      If more options existed after this, it would break the menu system in its current state. In cases like these, use array_set() to replace option with empty string,
		//      , add global disabled boolean to this script, and add edge case to Alarm 0 event in objDialogueBox, similarly to disabling Innkeeper.
		array_delete(global.actionOptions, 1, 1); //Remove option from actions array 
	} else {
		objDialogueBox.setDialogue("\"Hmmm... That's a pretty cool rug!\"");
	}//end if
	
}//end inspectRug
