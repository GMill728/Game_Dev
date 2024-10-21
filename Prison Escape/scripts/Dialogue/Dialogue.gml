// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dialogue(play, dial) constructor {
	player = play;
	dbox = dial;
	dialogueOptions = [];	
	startingLine = "";
	
	
	function displayMenu(){
		dbox.setDialogue(startingLine, dialogueOptions);	
	}
	
	function submitAction(choice) {}
}

function PrisonerDialogue(play, dial) : Dialogue(play, dial) constructor{
	prisonerThirdDialogueBranch = 0;
	prisonerFourthDialogueBranch = 0;
	prisonerFifthDialogueBranch = 0;
	prisonerSixthDialogueBranch = 0;
	
	prisonerDialogueBranch = 0;
	prisonerDisabled = false;
	
	startingLine = "Mysterious Prisoner:";
	dialogueOptions = ["\"Who are you, and what brings you here?\"", "\"Why is this room shrouded in such darkness?\"", "\"Is there any hope to escape from this hell, or are we doomed ?\"","Walk away"];
	
	
function submitPrisonerAction(choice) {//This is the main tree for the prisoner dialogue which handles switching to different branches throughout the dialogue progress
	//Written by Gavin Mills
	//Change set of possible functions based on the Prisoner's dialogue branch
	

	if (prisonerDialogueBranch == 0) { //Default Branch
	
		switch(choice) {
		case 0:
			whoAreYou();
			player.isTalkingToPrisoner = false;
			break;
		case 1:
			darkRoom();
			player.isTalkingToPrisoner = false;
			break;
		case 2:
			escapeQ();
			break;
		case 3:
			player.isTalkingToPrisoner = false;
			objDialogueBox.alarm[1]=1;
			break;
		}//end switch
	
	} else if (prisonerDialogueBranch == 1) { 
		
		switch(choice) {
		case 0:
			whoAreYou();
			player.isTalkingToPrisoner = false;
			break;
		case 1:
			darkRoom();
			player.isTalkingToPrisoner = false;
			break;
		case 2:
			stoneBranch();
			break;
		case 3:
			player.isTalkingToPrisoner = false;
			objDialogueBox.alarm[1]=1;
			break;
		}//end switch
		
	} else if (prisonerDialogueBranch == 2) { 
		
		switch(choice) {
		case 0:
			whoAreYou();
			player.isTalkingToPrisoner = false;
			break;
		case 1:
			darkRoom();
			player.isTalkingToPrisoner = false;
			break;
		case 2:
			chiselBranch();
			break;
		case 3:
			player.isTalkingToPrisoner = false;
			objDialogueBox.alarm[1]=1;
			break;
		}//end switch
	}
	
	else if (prisonerDialogueBranch == 3) { 
		
		switch(choice) {
		case 0:
			whoAreYou();
			player.isTalkingToPrisoner = false;
			break;
		case 1:
			darkRoom();
			player.isTalkingToPrisoner = false;
			break;
		case 2:
			guardBranch();
			break;
		case 3:
			player.isTalkingToPrisoner = false;
			objDialogueBox.alarm[1]=1;
			break;
		}//end switch
		
	}//end if
	
}//end submitPrisonerAction



/// @func whoAreYou()
/// @desc Handles Prisoner response to player asking who they are
/// @return {undefined}
function whoAreYou() {//this is a simple dialogue option written by Gavin Mills
	dbox.setDialogue("Mysterious Prisoner: \"A name long forgotten, a soul bound by shadows. I am but a whisper in the dark, a keeper of secrets that time has left behind\"");
}//end whoAreYou

/// @func darkRoom()
/// @desc Handles Prisoner response to player asking to order a drink and presents player with drink options.
/// @return {undefined}
function darkRoom() {//this is a simple dialogue option written by Gavin Mills
	dbox.setDialogue("Mysterious Prisoner: \"This darkness holds us because we're at the bottom, where no light dares to reach. For those cast this low, there is no salvation, darkness being our only companion.\"");
}//end darkRoom



/// @func escapeQ
/// @desc Handles the hints for the stone.
/// @return {undefined}
function escapeQ() { //this is the third dialogue branch for the prisoner written by Gavin Mills
    var prisonerText = "Mysterious Prisoner: \"";

    switch(prisonerThirdDialogueBranch) {
        case 0:
            prisonerText += "The entrance to the cell is guarded at all times so that is a no, but there is another way...\"";
            array_set(dialogueOptions, 2, "\"You're hiding something. Tell me about this 'other way.' \"");
            prisonerThirdDialogueBranch++;  // Increment branch
            break;
        case 1: 
            prisonerText += "Beneath the shroud of forgotten dreams, where the golden whispers hide, lies the secret you seek\"";
            array_set(dialogueOptions, 2, "\"Okay... \"");  // Replace previous options
            prisonerThirdDialogueBranch++;
            break;
        case 2: 
            prisonerText += "This place, beneath the shroud of forgotten dreams...\"";
            array_set(dialogueOptions, 2, "\"What do you mean?\"");
            prisonerThirdDialogueBranch++;
            break;
        case 3:
            prisonerText += "Golden whispers hide the truth beneath the shroud of forgotten dreams...\"\n";
			dbox.setDialogue(prisonerText);
			player.isTalkingToPrisoner = false;
			player.hasStoneLocation = true;

            return;
			
			
    }
	
    // Set the new dialogue
    dbox.setDialogue(prisonerText, dialogueOptions);
}



//function displayPrisonerMenu(){ //this is the fourth dialogue branch for the prisoner written by Gavin Mills
//	if (player.hasStone && prisonerFourthDialogueBranch == 0)
//	{
//		prisonerDialogueBranch = 1;
//		array_set(dialogueOptions, 2, "\"Is this what you meant?\"");
//	}
//	if (player.hasChisel && prisonerFifthDialogueBranch == 0)
//	{
//		prisonerDialogueBranch = 2;
//		array_set(dialogueOptions, 2, "\"I have both the stone and chisel. What now?\"");
//	}
//	if (player.hasGuardDistracted && prisonerSixthDialogueBranch == 0)
//	{
//		prisonerDialogueBranch = 3;
//		array_set(dialogueOptions, 2, "\"The guard is distracted. Now what?\"");
//	}
//	dbox.setDialogue("Mysterious Prisoner:     ...",dialogueOptions);
	
//}//end displayPrisonerMenu
/// @func stoneBranch()
/// @desc Handles the hints for the chisel.
/// @return {undefined}
function stoneBranch() { //this is the fifth dialogue branch for the prisoner written by Gavin Mills
    var prisonerText = "Mysterious Prisoner: \"";

    switch(prisonerFourthDialogueBranch) {
        case 0:
            prisonerText += "Ah, you've unearthed the voice of secrets. Now, let its murmurs guide your path through the shadows. The threads of your escape are nearly woven, yet one final strand eludes you.\"";
            array_set(dialogueOptions, 2, "\"You are willing to help, yet speak in riddles. Explain further.\"");
            prisonerFourthDialogueBranch++;  // Increment branch
            break;
		case 1:
            prisonerText += "Where the stone meets its edge, a hidden truth rests, concealed behind the shift of time's gentle hand\"";
            array_set(dialogueOptions, 2, "\"What edge, what do you mean?\"");
            prisonerFourthDialogueBranch++;  // Increment branch
            break;
		case 2:
            prisonerText += "The edge where stone meets time... Not all walls hold firm forever. Look closely, and you'll see where time has left its mark.\"";
			dbox.setDialogue(prisonerText);
			player.isTalkingToPrisoner = false;
			player.hasChiselLocation = true;
			

            return;
			
			
    }
	
    // Set the new dialogue
    dbox.setDialogue(prisonerText, dialogueOptions);
	}

	/// @func chiselBranch()
	/// @desc Handles the hints for the guard distraction.
	/// @return {undefined}
	function chiselBranch() { //this is the sixth dialogue branch for the prisoner written by Gavin Mills
	    var prisonerText = "Mysterious Prisoner: \"";
	
		prisonerText += "The whispers you've uncovered may travel farther than you think. Sometimes, the right place for them to be heard is just beyond the reach of your grasp.\"";
		dbox.setDialogue(prisonerText);
		player.hasTalkedToPrisoner = true;
		player.isTalkingToPrisoner = false;
	}

	/// @func guardBranch()
	/// @desc Final dialogue.
	/// @return {undefined}	
	function guardBranch() { //this is the seventh dialogue branch for the prisoner written by Gavin Mills
	    var prisonerText = "Mysterious Prisoner: \"";
	
	    prisonerText += "The path now lies open, as shadows part. Seize the moment, and let the iron carve your way to freedom. \"";
		dbox.setDialogue(prisonerText);
		player.isTalkingToPrisoner = false;
	}

	function unlocksPrisoner(unlockNumber)
	{
		switch (unlockNumber) {
			case 1:
				prisonerDialogueBranch = 1;
				array_set(dialogueOptions, 2, "\"Is this what you meant?\"");
				break;
			case 2:
				prisonerDialogueBranch = 2;
				array_set(dialogueOptions, 2, "\"I have both the stone and chisel. What now?\"");
				break;
			case 3:
				prisonerDialogueBranch = 3;
				array_set(dialogueOptions, 2, "\"The guard is distracted. Now what?\"");
				break;
		}
	}
}