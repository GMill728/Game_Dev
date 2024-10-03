/// @file Handles the Dialogue Branching and game logic for all interaction with the Guard. 
/// @author Griffin Nye
//  Date Created: 3/21/24
//  Last Date Modified: 9/22/24

global.guardDialogueOptions = ["\"Hey, how's it going?\"", "\"How the heck do I get out of here?\"", "Walk away"]; //Base Dialogue Options
global.guardFirstDialogueBranch = 0;
global.guardSecondDialogueBranch = 0;

/// @func displayGuardMenu()
/// @desc Displays the Guard dialogue menu to the player using objDialogueBox
/// @return {undefined}
function displayGuardMenu(){
	objDialogueBox.setDialogue("Guard: \"...\"", global.guardDialogueOptions);
}//end displayGuardMenu

/// @func submitGuardAction(choice)
/// @desc Handles calling appropriate Guard dialogue branch based on player's selection in objDialogueBox
/// @param {real} choice Index of the option selected by player in objDialogueBox
/// @return {undefined}
function submitGuardAction(choice) {
	
	switch(choice) {
		
	case 0: //First Dialogue Option Branch
		handleFirstBranch();
		break;
	case 1: //Second Dialogue Option Branch
		handleSecondBranch();
		break;
	case 2: //Walk Away Branch
		objPlayer.isTalkingToGuard = false;
		displayActionsMenu();
		break;
	}//end switch
	
}//end submitGuardAction

/// @func handleFirstBranch()
/// @desc Handles selecting appropriate Guard response based on player progress through the first dialogue branch (ie all first options)
/// @return {undefined}
function handleFirstBranch() {
	var guardText = "Guard: \"";
	
	switch(global.guardFirstDialogueBranch) {
	case 0: //How are you? case
		guardText += "Not bad. A little boring around here today...\"";
		array_set(global.guardDialogueOptions, 0, "\"Yeah, it seems pretty empty today. Do you work here?\""); //Replace previous first option
		global.guardFirstDialogueBranch++;																	  //Increment dialogue branch to spawn next choice
		break;
	case 1: //Do you work here? case
		guardText += "Yeah, I do actually.\""
		array_set(global.guardDialogueOptions, 0, "\"Oh, cool! What do you do around here?\""); //Replace previous first option
		global.guardFirstDialogueBranch++;													   //Increment dialogue branch to spawn next choice
		break;
	case 2: //What do you do around here? case
		guardText += "The innkeeper hired me a while back for security, due to my stature. " +
		                "Things can get a little rowdy around here sometimes, especially with the varmints that come around these parts.\""; 
		array_set(global.guardDialogueOptions, 0, "\"I gotcha. How'd you land the job?\""); //Replace previous first option
		global.guardFirstDialogueBranch++;                                                  //Increment dialogue branch to spawn next choice
		break;
	case 3://How'd you land the job? case
		guardText += "Well, the innkeepr is actually my brother-in-law.\n" +
				        "I was looking for work and he was looking for a watchful eye, so it kind of worked out. " +
				        "Here I am 12 years later... *sigh*\n" +
				        "Sadly, it doesn't pay that well, but I suppose I shouldn't expect much for standing around on days like these.\""
		array_set(global.guardDialogueOptions, 0, "\"Dang, that sucks\""); //Replace previous first option
		global.guardFirstDialogueBranch++;                                 //Increment dialogue branch to spawn next choice
		objPlayer.hasInfluencedGuard = true;                               //Unlock progression through second Guard dialogue branch
		break;		 
	case 4: //That sucks case
		guardText += "Yeah, it does.\"";
		objDialogueBox.setDialogue(guardText);
		objPlayer.isTalkingToGuard = false;
		return;
	}//end switch
	
	objDialogueBox.setDialogue(guardText, global.guardDialogueOptions);

}//end handleFirstBranch

/// @func handleSecondBranch()
/// @desc Handles selecting appropriate Guard response based on player progress through the second dialogue branch (ie all second options)
/// @return {undefined}
function handleSecondBranch() {
	var guardText = "Guard: \"";
	
	switch (global.guardSecondDialogueBranch) {
	case 0://How do I get out of here? case
		
		//If player has not gotten to know guard, get brushed off and exit dialogue
		if (!objPlayer.hasInfluencedGuard) {
			guardText += "Same way you came in I suppose.\"";
			objDialogueBox.setDialogue(guardText);
			objPlayer.isTalkingToGuard = false;
		} else { //Otherwise, obtain information about the key and progress down 2nd dialogue branch
			guardText += "Well, normally through that door, but we're actually closed right now and the boss won't let me unlock the door after close.\n" +
						   "I'm not quite sure how we missed you to be honest.\"";
			array_set(global.guardDialogueOptions, 1, "\"So is there a key? Do you know where it is?\""); //Replace previous second option
			global.guardSecondDialogueBranch++;                                                           //Increment dialogue branch to spawn next choice
			objDialogueBox.setDialogue(guardText, global.guardDialogueOptions);
		}//end if
		
		break;
		
	case 1: //Is there a key? branch
		guardText += "There is... and I do... " +
		                "but I can't just give it out to anyone, at least not without a little *cash reward*\"\n\n" +
					    "***You reach into your pockets to find that they're empty.***\n" +
						"You'll have to see what you can find.";
		array_set(global.guardDialogueOptions, 1, "\"Ok, I'll see what I can do.\"");  //Replace previous second option
		global.guardSecondDialogueBranch++;                                            //Increment dialogue branch to spawn next choice
		objDialogueBox.setDialogue(guardText, global.guardDialogueOptions);
		break;
	case 2: //I'll see what I can do branch
	
		if (!objPlayer.hasCash) { //If player has not acquired cash, initiate small talk
			guardText += "Sounds good partner, I'll be here.\"";
			array_set(global.guardDialogueOptions, 0, "\"So doesn't it get boring just standing there all day without moving?\""); //Replace previous first option
			array_set(global.guardDialogueOptions, 1, "\"I'm still trying to devise a plan here. I'll be back.\"");                //Replace previous second option
			objPlayer.isSearchingForCash = true;                                                                                      //Unlock opening the register
			objPlayer.isTalkingToGuard = false;
			objDialogueBox.setDialogue(guardText);
			break;
		} else { //If player has acquired the cash, then bribe the guard
			bribeGuard();
		}//end if
		
		break;
		
	}//end switch
	
}//end handleSecondBranch

/// @func bribeGuard()
/// @desc Handles Guard response to being bribed. Will end and disable interaction with the Guard and unlock interaction with the rug.
/// @return {undefined}
function bribeGuard() {
	var guardText = "Guard: \"" +
					   "YEE-HAW!!!\nI'll be eatin' good tonight!\n" +
					   "Whoops... that was a little loud.\n" +
					   "He keeps the key under the rug over yonder.\n" +
					   "Now hurry, before he comes back and you get me in trouble!\"";
	
	objDialogueBox.setDialogue(guardText);
	objPlayer.isTalkingToGuard = false;    //Stop talking to Guard
	objPlayer.hasReceivedKeyLocation = true;  //Unlock ability to retrieve key under rug
	array_delete(global.actionOptions, 3, 1); //Remove talking to the Guard from Actions Menu 
											  //NOTE: This only works because he is the last option in the list, if more options existed after him, doing so would break
											  //      the menu system in its current state. In cases like these, use array_set() to replace option with empty string,
											  //      add global disabled boolean to this script, and add edge case to Alarm 0 event in objDialogueBox, similarly to disabling Innkeeper.
}//end bribeGuard