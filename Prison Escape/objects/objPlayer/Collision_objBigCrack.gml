/// @description Insert description here
// You can write your code in this editor
if(thisPlayer.hasTalkedToPrisoner && thisPlayer.hasGuardDistracted && keyboard_check_pressed( ord("F") ) ) {
	drawBox();
	objDialogueBox.setDialogue("You slip through the cracks in the wall, escaping the prison once and for all.");
	hasWon = true; //Indicate Player has won
}