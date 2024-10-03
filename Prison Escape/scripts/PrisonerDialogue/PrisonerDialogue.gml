/// @file Handles the Dialogue Branching and game logic for all interaction with the Prisoner. 
/// @author Gavin Mills
//  Griffen Nya created the strucure of the code which is heavily used here
//  Date Created by Griffen: 3/21/24
//  Date Edited by Gavin: 10/3/24
//  Leaving as many comments as possible from the original and editing description for ease of use
global.prisonerThirdDialogueBranch = 0;
global.prisonerDialogueBranch = 0;
global.prisonerDisabled = false;
global.prisonerDialogueOptions = [];

/// @func displayPrisonerMenu()
/// @desc Displays the Prisoner dialogue menu to the player using objDialogueBox
/// @return {undefined}
function displayPrisonerMenu(){
	var prisonerDialogueOptions = ["\"Who are you, and what brings you here?\"", "\"Why is this room shrouded in such darkness?\"", "\"Is there any hope to escape from this hell, or are we doomed ?\"","Walk away"];
	objDialogueBox.setDialogue("Mysterious Prisoner:     ...", prisonerDialogueOptions);
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
			whoAreYou();
			objPlayer.isTalkingToPrisoner = false;
			break;
		case 1:
			darkRoom();
			break;
		case 2:
			escapeQ();
			break;
		case 3:
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
	
	} else if (global.prisonerDialogueBranch == 3) { //Cash Register Branch
		
		switch(choice) {
		case 0:
			raidCashRegister();
			objPlayer.isTalkingToPrisoner = false;
			break;
		}//end switch

	} else if (global.prisonerDialogueBranch == 2) { //Player escape question
		
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
		
	}//end if
	
}//end submitPrisonerAction

/// @func askToGetOut()
/// @desc Handles Prisoner response to player asking who they are
/// @return {undefined}
function whoAreYou() {
	objDialogueBox.setDialogue("Prisoner: \"A name long forgotten, a soul bound by shadows. I am but a whisper in the dark, a keeper of secrets that time has left behind\"");
}//end whoAreYou

/// @func askForADrink()
/// @desc Handles Prisoner response to player asking to order a drink and presents player with drink options.
/// @return {undefined}
function darkRoom() {
	objDialogueBox.setDialogue("Prisoner: \"This darkness holds us because we're at the bottom, where no light dares to reach. For those cast this low, there is no salvation, darkness being our only companion.\"");
}//end darkRoom

/*
var drinkOptions = ["\"Could I get a ginger ale?\"", "\"Do you have any root beer?\""];
	global.prisonerDialogueBranch = 1; //Change branch to drink ordering branch
	objDialogueBox.setDialogue("Prisoner: \"You sure can, partner! What can I 'getcha?\"", drinkOptions);




//this is a way to create small options
//@desc Handles Prisoner response to player ordering a ginger ale. Ends interaction with Prisoner.
*/




function escapeQ() {
    var prisonerText = "Prisoner: \"";
    global.prisonerDialogueOptions = [];  // Clear previous options to ensure no overlap

    switch(global.prisonerThirdDialogueBranch) {
        case 0:
            prisonerText += "The entrance to the cell is guarded at all times so that is a no, but there is another way...\"";
            array_set(global.prisonerDialogueOptions, 0, "\"You're hiding something. Tell me about this 'other way' \"");
            global.prisonerThirdDialogueBranch++;  // Increment branch
            break;
        case 1: 
            prisonerText += "\"Beneath the shroud of forgotten dreams, where the golden whispers hide, lies the secret you seek\"";
            array_set(global.prisonerDialogueOptions, 0, "\"Okay... \"");  // Replace previous options
            global.prisonerThirdDialogueBranch++;
            break;
        case 2: 
            prisonerText += "\"This place, beneath the shroud of forgotten dreams...\"";
            array_set(global.prisonerDialogueOptions, 0, "\"What do you mean?\"");
            global.prisonerThirdDialogueBranch++;
            break;
        case 3:
            prisonerText += "Well, the innkeeper is actually my brother-in-law...\n" +
                            "Here I am 12 years later... *sigh*\n";
            array_set(global.prisonerDialogueOptions, 0, "\"Dang, that sucks\"");
            global.prisonerThirdDialogueBranch++;
            objPlayer.hasInfluencedGuard = true;  // Progress through second Guard dialogue branch
            break;		 
        case 4:
            prisonerText += "Yeah, it does.\"";
            objPlayer.isTalkingToPrisoner = false;
            return;
    }

    // Set the new dialogue
    objDialogueBox.setDialogue(prisonerText, global.prisonerDialogueOptions);
}


	





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