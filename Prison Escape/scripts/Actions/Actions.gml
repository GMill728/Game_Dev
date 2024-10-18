///// @file Handles the Dialogue Branching and game logic for all player actions in a text-based implementation of the game. Script to be deprecated in future version of the game.
///// @author Griffin Nye
////  Date Created: 3/21/24
////  Last Date Modified: 10/6/24 by William. Previously by Gavin, Wilfred.
////  Please clean up comments/code as you see fit. Try not to break anything, ask if anything unclear!

///*** NOTE: This Script will be deprecated once Movement and Collision are implemented, however, is very important for ensuring all of your game logic is mapped out appropriately. ***/

//global.actionOptions = ["Inspect Crack", "Inspect Other...", "Approach Prisoner", "Approach Door"];

///// @func displayActionsMenu()
///// @desc Displays the Actions Menu to the player using objDialogueBox
///// @return {undefined}
//function displayActionsMenu() {
//	objDialogueBox.setDialogue("What would you like to do?", global.actionOptions);
//}//end displayActionsMenu

///// @func submitPlayerAction(choice)
///// @desc Handles calling appropriate dialogue branch based on player's selection in objDialogueBox
///// @param {real} choice Index of the option selected by player in objDialogueBox
///// @return {undefined}




////THESE FUNCTIONS ARE COMMENTED IN EACH MENU AND SHOULD WORK ONCE COLLISION IS SET UP***************************************************
//function submitPlayerAction(choice) {
//	//Call appropriate dialogue branch based on player choice
//	switch(choice) {
//		case 0:
//			chiselCrack();
//			break;
//		case 1:
//			objPlayer.isInspecting = true;
//			displayInspectMenu();
//			break;
//		case 2:
//			objPlayer.isTalkingToPrisoner = true;
//			displayPrisonerMenu();
//			break;
//		case 3:
//			objPlayer.isTalkingToGuard = true;
//			displayGuardMenu();	
//			break;
			
//		default:
//			displayActionsMenu(); 
//			break; 
//	}//end switch
	
//}//end submitPlayerAction


