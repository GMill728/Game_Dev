/// @file Handles the Dialogue Branching and game logic for all interaction with the Guard. 
/// @author Griffin Nye
//  Date Created: 3/21/24
//  Last Date Modified: 9/22/24

global.guardDialogueOptions = ["Knock on door"]; //Base Dialogue Options
global.guardInteractionAttempts = 0;
global.guardSecretDialogueUnlocked = false; 
global.guardSecretDialogueBranch = 0; 
global.guardSecretDialogueExhausted = false; 

/// @func displayGuardMenu()
/// @desc Displays the Guard dialogue menu to the player using objDialogueBox
/// @return {undefined}
function displayGuardMenu(){
	if (global.guardSecretDialogueExhausted)
	{
		handleInnerMonologue(); 
		return; 
	}
	objDialogueBox.setDialogue("", global.guardDialogueOptions);
}//end displayGuardMenu

/// @func submitGuardAction(choice)
/// @desc Handles calling appropriate Guard dialogue branch based on player's selection in objDialogueBox
/// @param {real} choice Index of the option selected by player in objDialogueBox
/// @return {undefined}
/// @modified by Wilfred
function submitGuardAction(choice) 
{
	if (global.guardSecretDialogueUnlocked)
	{
		handleSecretDialogue(); // Unlock secret dialogue if triggered
		return;
	}
	
	global.guardInteractionAttempts++; 
	
	switch(global.guardInteractionAttempts) {
		
	case 1: //First Dialogue Option Branch
		handleFirstAttempt();
		break;
		
	case 2: //Second Dialogue Option Branch
		handleSecondAttempt();
		break;
		
	case 3: //Walk Away Branch
		handleThirdAttempt(); 
		break; 
		
	case 4:
		handleSilentAttempt();
		break; 
		
	case 5:
		handleSilentAttempt(); 
		break; 
	
	default:
		if(global.guardInteractionAttempts > 5)
		{
			unlockSecretDialogue();
		}
		break; 
	}//end switch
	
}//end submitGuardAction

/// @func handleFirstAttempt()
/// @desc Display dialogue for the first knock attempt
// @return {undefined}
// @creator Wilfred 
function handleFirstAttempt()
{
	var guardText = "Guard: \"What do you want? I'm not here to entertain you.\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; // close window after first attempt
}

function handleSecondAttempt()
{
	var guardText = "Guard: \"Talk? You think I have time for your drivel?\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; 
}

function handleThirdAttempt()
{
	var guardText = "Guard: \"Is this a game to you? Because I don't find it amusing.\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; 
}

function handleSilentAttempt()
{
	var guardText = "Guard: \".............\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; 
}

function unlockSecretDialogue()
{
	global.guardSecretDialogueUnlocked = true; 
	var guardText = "Guard: \"Fine! You Win! What is it that you want? All this banging is enough to make a man mad!\""; 
	objDialogueBox.setDialogue(guardText, ["\"What lead you to become a guard?\""]);
}

function handleInnerMonologue()
{
	var monologueText = ""; 
	if (global.guardSecretDialogueUnlocked && global.guardSecretDialogueExhausted)
	{
		monologueText += "Player: \"He's not as I thought. Maybe there's more to him than just a grumpy guard.\""; 		
	}
	else
	{
		monologueText = "Player: \"No point in pushing my luck any further.\""; 
	}
	objDialogueBox.setDialogue(monologueText); 
	objPlayer.isTalkingToGuard = false; 
}
/// @func handleFirstBranch()
/// @desc Handles selecting appropriate Guard response based on player progress through the first dialogue branch (ie all first options)
/// @return {undefined}
function handleSecretDialogue()
{
	var guardText = "Guard: \"";
	
	switch(global.guardSecretDialogueBranch)
	{
	case 0: //How are you? case
		guardText += "Why do you care? It's not like my story will get you out of here.\""; 
		array_set(global.guardDialogueOptions, 0, "\"............\""); 
		global.guardSecretDialogueBranch++;		  //Increment dialogue branch to spawn next choice
		break;
	case 1: //Do you work here? case
		guardText += "Fine if you must know. I had dreams once, but they faded long ago with my ambition. " +
					 "Now I'm stuck with cursed duty, dealing with annoying prisoners like you.\""; 
		array_set(global.guardDialogueOptions, 0, "\"What kind of dreams did you have?\""); //Replace previous first option
		global.guardSecretDialogueBranch++;													   //Increment dialogue branch to spawn next choice
		break;
	case 2:
		guardText += "They were of glory and honor on the battlefield. I was young, a fierce fighter with pride " +
					 "But after a skirmish left me with an arrow to the knee, those dreams turned to dust.\""; 
		array_set(global.guardDialogueOptions, 0, "\"..........\""); 
		global.guardSecretDialogueBranch++; 
		break; 
	case 3: //What do you do around here? case
		guardText += " You know, I suppose we all have our own burden to bear. " +
		                "Even those stuck behind bars like you.\""; 
		objPlayer.isTalkingToGuard = false; //end converstation
		global.guardSecretDialogueExhausted = true; 
		break;
	}//end switch
	
	objDialogueBox.setDialogue(guardText, global.guardDialogueOptions);

}//end handleFirstBranch

