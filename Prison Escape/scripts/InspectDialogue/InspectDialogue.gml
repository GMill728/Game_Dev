/// @file Handles inspecting various parts of the room, since I couldn't fit it all on the main page.
/// @author William Grant
//  Griffen Nya created the strucure of the code which is heavily used here
//  Date Created by Griffen: 3/21/24
//  Date Edited/Completed by William: 10/6/24
//  Leaving as many comments as possible from the original and editing description for ease of use
//  Very messy, clean as needed.
global.inspectDialogueOptions = ["Look at straw pile.", "Look at loose bricks.", "Walk away."];
global.disableStraw = false;
global.disableBrick = false;


/// @func displayInspectMenu()
/// @desc Displays the Inspect dialogue menu to the player using objDialogueBox
/// @return {undefined}
function displayInspectMenu(){
	objDialogueBox.setDialogue("There's some interesting things around...",global.inspectDialogueOptions);
}//end displayInspectMenu

/// @func submitInspectAction(choice)
/// @desc Handles calling appropriate Inspect dialogue branch based on player's selection in objDialogueBox
/// @param {real} choice Index of the option selected by player in objDialogueBox
/// @return {undefined}
function submitInspectAction(choice) {
	
		switch(choice) {
		case 0:
			inspectStraw();
			objPlayer.isInspecting = false;
			break;
		case 1:
			inspectBrick();
			objPlayer.isInspecting = false;
			break;
		default:
			objPlayer.isInspecting = false;
			displayActionsMenu();
			break;
		}//end switch
	return;
}//end submitInspectAction

/// @func inspectStraw()
/// @desc Handles inspecting the straw pile for the stone.
/// @return {undefined}
function inspectStraw() {
	if (global.disableStraw)
	{
		objDialogueBox.setDialogue("No wonder I couldn't sleep, this stone whispers like mad.");
	}
	else if (objPlayer.hasStoneLocation)
	{
		objDialogueBox.setDialogue("Oh, that's why it wasn't very comfortable. There's a stone in here.\nWhispering Stone Acquired!");
		objPlayer.hasStone = true;
		global.disableStraw  = true;
	}
	else
	{
		objDialogueBox.setDialogue("Just some hay. It's not very comfortable.");
	}
	
}//end inspectStraw

/// @func inspectBrick()
/// @desc Handles inspecting the loose bricks for the chisel.
/// @return {undefined}
function inspectBrick() {
	if (global.disableBrick)
	{
		objDialogueBox.setDialogue("The brick is on the floor, and chisel in hand.");
	}
	else if (objPlayer.hasChiselLocation)
	{
		objDialogueBox.setDialogue("With enough force, I pull it open... and there's a chisel inside!\nChisel Acquired!");
		objPlayer.hasChisel = true;
		global.disableBrick = true;
	}
	else
	{
		objDialogueBox.setDialogue("Some loose bricks, but pulling on them is very hard.");
	}
}//end inspectBrick

/*
var drinkOptions = ["\"Could I get a ginger ale?\"", "\"Do you have any root beer?\""];
	global.prisonerDialogueBranch = 1; //Change branch to drink ordering branch
	objDialogueBox.setDialogue("Prisoner: \"You sure can, partner! What can I 'getcha?\"", drinkOptions);




//this is a way to create small options
//@desc Handles Prisoner response to player ordering a ginger ale. Ends interaction with Prisoner.
*/




//function getGingerAle() {
//	global.prisonerDialogueBranch = 0; //Reset branch to default branch
//	objDialogueBox.setDialogue("Prisoner: \"There ya go, partner. I'll put it on your tab.\"");	
//}//end getGingerAle

///// @func getRootBeer()
///// @desc Handles Prisoner response to player ordering a root beer. Presents different responses based on whether or not the player is currently searching for cash to bribe the Guard.
/////       Ends interaction with Prisoner if not searching for cash, otherwise, switches player to Cash Register branch.
///// @return {undefined}
//function getRootBeer() {
	
//	var actions;
//	var prisonerText;
	
//	//Response if player is searching for cash
//	if (objPlayer.isSearchingForCash) {
//		prisonerText = "Prisoner: \"Sure do!\nHmmm.... appears this barrel is all out.\nI got more in the back.\nI'll be right back.\"\n\nThe cash register seems to be unlocked...";
//		actions = ["Open the cash register"]; 
//		global.prisonerDialogueBranch = 2; //Change branch to cash register branch
//	} else {  //Default Response 
//		prisonerText = "Prisoner: \"Sure do!\n Here ya go, partner! I'll put it on your tab.\"";
//		actions = [];
//		global.prisonerDialogueBranch = 0; //Reset branch to default branch
//	}//end if
	
//	objDialogueBox.setDialogue(prisonerText, actions);
	
//}//end getRootBeer

///// @func raidCashRegister()
///// @desc Handles Game response to player raiding the cash register. *TO BE REMOVED ONCE MOVEMENT & COLLISION UPDATED*
///// @return {undefined}
//function raidCashRegister() {
//	objDialogueBox.setDialogue("You open the cash register to find the cash register loaded with bills.\nThey must have been busy earlier.\n\n***You have acquired a wad of cash***");
//	objPlayer.hasCash = true;				 //Give the player the cash object
//	array_set(global.actionOptions, 2, "");  //Remove talking to the prisoner as an action option, as he is in the back
//	global.prisonerDisabled = true;         //Indicate Prisoner option is now disabled in Actions Menu 
//	//Unlock bribing the Guard
//	array_set(global.guardDialogueOptions, 1, "***Slip the guard a few bills***\n\"You think you could tell me where that key is now?\"");
//	//global.guardSecondDialogueBranch++;  //Increase second dialogue branch
//}//end raidCashRegister