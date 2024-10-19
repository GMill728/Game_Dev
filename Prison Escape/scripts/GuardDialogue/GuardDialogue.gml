/// @file Handles the Dialogue Branching and game logic for all interaction with the Guard. 
/// @author Griffin Nye
//  Date Created: 3/21/24
//  Last Date Modified: 10/6/24 by William. Mostly done by Wilfred.
//  Edited by gavin 10/19

global.guardDialogueOptions = ["Knock on door"]; //Base Dialogue Options
global.guardInteractionAttempts = 0;
global.guardSecretDialogueUnlocked = false; 
global.guardSecretDialogueBranch = 0; 
global.guardSecretDialogueExhausted = false; 
global.disableGuard = false;

/// @func displayGuardMenu()
/// @desc Displays the Guard dialogue menu to the player using objDialogueBox
/// @return {undefined}
/// @Modified by Wilfred on 10/03/24
/// @Modified by William
//  Edited by gavin 10/19



function displayGuardMenu(){
	if (objPlayer.hasStone && objPlayer.hasChisel && objPlayer.hasTalkedToPrisoner)
	{
		array_set(global.guardDialogueOptions, 0, "Secretly throw stone.");
		global.guardSecretDialogueExhausted = false;
	}
	 if (global.guardSecretDialogueExhausted || global.disableGuard)
	{
		handleInnerMonologue(); 
		objPlayer.isTalkingToGuard = false;
		return; 
	}
	
	objDialogueBox.setDialogue("", global.guardDialogueOptions);
}//end displayGuardMenu

/// @func submitGuardAction(choice)
/// @desc Handles calling appropriate Guard dialogue branch based on player's selection in objDialogueBox
/// @param {real} choice Index of the option selected by player in objDialogueBox
/// @return {undefined}
/// @modified by Wilfred 10/03/24
/// @modified by Gavin 10/19
/// @modified by William
function submitGuardAction(choice) 
{
	if (objPlayer.hasTalkedToPrisoner && !global.disableGuard)
	{
		throwStone();
		objPlayer.isTalkingToGuard = false;
		return;
	}
	
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
		
	case 3: //third attempt branch
		handleThirdAttempt(); 
		break; 
		
	case 4:	//if player keeps knocking on door
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

/// @func throwStone()
/// @desc Display dialogue and remove stone for distracting guard
// @return {undefined}
// @creator William
function throwStone()
{
	var guardText = "You throw the stone, and it flies through the window and hits a far wall, noises singing from it. The guard gets up and grumbles, going over to check what it is.";
	objPlayer.hasGuardDistracted = true;
	objPlayer.isTalkingToGuard = false;
	global.disableGuard = true;
	objDialogueBox.setDialogue(guardText);
}


/// @func handleFirstAttempt()
/// @desc Display dialogue for the first knock attempt
/// @return {undefined}
/// @creator Wilfred 
function handleFirstAttempt()
{
	var guardText = "Guard: \"What do you want? I'm not here to entertain you.\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; // close window after first attempt
}

/// @func handleSecondAttempt()
/// @desc Display dialogue for the second knock attempt
/// @return {undefined}
/// @creator Wilfred 
function handleSecondAttempt()
{
	var guardText = "Guard: \"Talk? You think I have time for your drivel?\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; 
}

/// @func handleThirdAttempt()
/// @desc Display dialogue for the third knock attempt
/// @return {undefined}
/// @creator Wilfred 
function handleThirdAttempt()
{
	var guardText = "Guard: \"Is this a game to you? Because I don't find it amusing.\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; 
}

/// @func handleSilentAttempt()
/// @desc Display dialogue for consecutive attemps until secret dialogue is unlocked. 
/// @return {undefined}
/// @creator Wilfred 
function handleSilentAttempt()
{
	var guardText = "Guard: \".............\""; 
	objDialogueBox.setDialogue(guardText); 
	objPlayer.isTalkingToGuard = false; 
}

/// @func unlockSecretDialogue()
/// @desc Display secret dialogue after player knocks 5 times. 
/// @return {undefined}
/// @creator Wilfred 
function unlockSecretDialogue()
{
	global.guardSecretDialogueUnlocked = true; 
	var guardText = "Guard: \"Fine! You Win! What is it that you want? All this banging is enough to make a man mad!\""; 
	objDialogueBox.setDialogue(guardText, ["\"What lead you to become a guard?\""]);
}

/// @func handleInnerMonologue()
/// @desc Handles conditionals for when inner monologue is displayed
/// @return {undefined}
/// @creator Wilfred 
//  @Modified by Gavin Mills 10/19
function handleInnerMonologue()
{
	var monologueText = ""; 
	if (!objPlayer.hasTalkedToPrisoner && objPlayer.hasStone && objPlayer.hasChisel)
	{
		monologueText += "[i]I've got the stone and chisel, but something still feels missing... Maybe that cryptic fool knows what's next.[/i]";
	} 
	else if (global.guardSecretDialogueUnlocked && global.guardSecretDialogueExhausted)
	{
		monologueText += "[i]He's not as bad as I thought. Maybe there's more to him than just a grumpy guard.[/i]"; 		
	}
	else
	{
		monologueText = "[i]Looks like the guard is distracted, No point in pushing my luck any further.[/i]"; 
	}
	objDialogueBox.setDialogue(monologueText); 
	objPlayer.isTalkingToGuard = false; 
}

/// @func handleSecretDialogue()
/// @desc Handles conditionals for when secret dialogue is displayed
/// @return {undefined}
/// @creator Wilfred
function handleSecretDialogue()
{
	var guardText = "Guard: \"";
	
	switch(global.guardSecretDialogueBranch)
	{
	case 0: 
		guardText += "Why do you care? It's not like my story will get you out of here.\""; 
		array_set(global.guardDialogueOptions, 0, "\"............\""); 
		global.guardSecretDialogueBranch++;		  //Increment dialogue branch to spawn next choice
		break;
	case 1: 
		guardText += "Fine if you must know. I had dreams once, but they faded long ago with my ambition. " +
					 "Now I'm stuck with cursed duty, dealing with annoying prisoners like you.\""; 
		array_set(global.guardDialogueOptions, 0, "\"What kind of dreams did you have?\""); //Replace previous first option
		global.guardSecretDialogueBranch++;					
		break;
	case 2: 
		guardText += ".............\""; 
		array_set(global.guardDialogueOptions, 0, "\"..........\"");
		global.guardSecretDialogueBranch++; 
		break; 
	case 3: 
		guardText += "......Dreams....."
		array_set(global.guardDialogueOptions, 0, "\"..........\"");
		global.guardSecretDialogueBranch++;
		break;
	case 4:
		guardText += "They were of glory and honor on the battlefield. I was young, a fierce fighter with pride " +
					 "But after a skirmish left me with an arrow to the knee, those dreams turned to dust.\""; 
		array_set(global.guardDialogueOptions, 0, "\"............\"");
		global.guardSecretDialogueBranch++; 
		break; 
		
	case 5: //What do you do around here? case
		guardText += " You know, I suppose we all have our own burden to bear. " +
		                "Even those stuck behind bars like you.\"";
		objDialogueBox.setDialogue(guardText);
		objPlayer.isTalkingToGuard = false; //end converstation
		global.guardSecretDialogueExhausted = true; 
		return;
	}//end switch
	objDialogueBox.setDialogue(guardText, global.guardDialogueOptions);
}//end handleFirstBranch

