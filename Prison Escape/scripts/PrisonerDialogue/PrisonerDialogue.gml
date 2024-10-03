/// @file Handles the Dialogue Branching and game logic for all interaction with the Prisoner. 
/// @author Griffin Nye
//  Date Created: 3/21/24
//  Last Date Modified: 9/22/24

global.prisonerDialogueBranch = 0;
global.prisonerDisabled = false;

/// @func displayPrisonerMenu()
/// @desc Displays the Prisoner dialogue menu to the player using objDialogueBox
/// @return {undefined}
function displayPrisonerMenu(){
	var prisonerDialogueOptions = ["\"Do you know how I get out of here?\"", "\"Could I purchase a drink?\"", "Walk away"];
	objDialogueBox.setDialogue("Prisoner: \"Howdy partner! What can I do for ya?\"", prisonerDialogueOptions);
}//end displayPrisonerMenu

/// @func submitPrisonerAction(choice)
/// @desc Handles calling appropriate Prisoner dialogue branch based on player's selection in objDialogueBox
/// @param {real} choice Index of the option selected by player in objDialogueBox
/// @return {undefined}
function submitPrisonerAction(choice) {
	
	//Change set of possible functions based on the Prisoner's dialogue branch
	if (global.prisonerDialogueBranch == 0) { //Default Branch
	
		switch(choice) {
		case 0:
			askToGetOut();
			objPlayer.isTalkingToPrisoner = false;
			break;
		case 1:
			askForADrink();
			break;
		case 2:
			objPlayer.isTalkingToPrisoner = false;
			displayActionsMenu();
			break;
		}//end switch
	
	} else if (global.prisonerDialogueBranch == 1) { //Ordering Drinks Branch
		
		switch(choice) {
		case 0:
			getGingerAle();
			objPlayer.isTalkingToPrisoner = false
			break;
		case 1:
			getRootBeer();
			objPlayer.isTalkingToPrisoner = objPlayer.isSearchingForCash ? true : false;
			break;
		}//end switch
		
	} else if (global.prisonerDialogueBranch == 2) { //Cash Register Branch
		
		switch(choice) {
		case 0:
			raidCashRegister();
			objPlayer.isTalkingToPrisoner = false;
			break;
		}//end switch
		
	}//end if
	
}//end submitPrisonerAction

/// @func askToGetOut()
/// @desc Handles Prisoner response to player asking how to get out of here.
/// @return {undefined}
function askToGetOut() {
	objDialogueBox.setDialogue("Prisoner: \"I'm a very busy man, I ain't got time for this.\nGo ask Buster over yonder.\nHe never does anything 'round these parts anyway.\"");
}//end askToGetOut

/// @func askForADrink()
/// @desc Handles Prisoner response to player asking to order a drink and presents player with drink options.
/// @return {undefined}
function askForADrink() {
	var drinkOptions = ["\"Could I get a ginger ale?\"", "\"Do you have any root beer?\""];
	global.prisonerDialogueBranch = 1; //Change branch to drink ordering branch
	objDialogueBox.setDialogue("Prisoner: \"You sure can, partner! What can I 'getcha?\"", drinkOptions);
}//end askForADrink

/// @func getGingerAle()
/// @desc Handles Prisoner response to player ordering a ginger ale. Ends interaction with Prisoner.
/// @return {undefined}
function getGingerAle() {
	global.prisonerDialogueBranch = 0; //Reset branch to default branch
	objDialogueBox.setDialogue("Prisoner: \"There ya go, partner. I'll put it on your tab.\"");	
}//end getGingerAle

/// @func getRootBeer()
/// @desc Handles Prisoner response to player ordering a root beer. Presents different responses based on whether or not the player is currently searching for cash to bribe the Guard.
///       Ends interaction with Prisoner if not searching for cash, otherwise, switches player to Cash Register branch.
/// @return {undefined}
function getRootBeer() {
	
	var actions;
	var prisonerText;
	
	//Response if player is searching for cash
	if (objPlayer.isSearchingForCash) {
		prisonerText = "Prisoner: \"Sure do!\nHmmm.... appears this barrel is all out.\nI got more in the back.\nI'll be right back.\"\n\nThe cash register seems to be unlocked...";
		actions = ["Open the cash register"]; 
		global.prisonerDialogueBranch = 2; //Change branch to cash register branch
	} else {  //Default Response 
		prisonerText = "Prisoner: \"Sure do!\n Here ya go, partner! I'll put it on your tab.\"";
		actions = [];
		global.prisonerDialogueBranch = 0; //Reset branch to default branch
	}//end if
	
	objDialogueBox.setDialogue(prisonerText, actions);
	
}//end getRootBeer

/// @func raidCashRegister()
/// @desc Handles Game response to player raiding the cash register. *TO BE REMOVED ONCE MOVEMENT & COLLISION UPDATED*
/// @return {undefined}
function raidCashRegister() {
	objDialogueBox.setDialogue("You open the cash register to find the cash register loaded with bills.\nThey must have been busy earlier.\n\n***You have acquired a wad of cash***");
	objPlayer.hasCash = true;				 //Give the player the cash object
	array_set(global.actionOptions, 2, "");  //Remove talking to the prisoner as an action option, as he is in the back
	global.prisonerDisabled = true;         //Indicate Prisoner option is now disabled in Actions Menu 
	//Unlock bribing the Guard
	array_set(global.guardDialogueOptions, 1, "***Slip the guard a few bills***\n\"You think you could tell me where that key is now?\"");
	//global.guardSecondDialogueBranch++;  //Increase second dialogue branch
}//end raidCashRegister