/// @description Insert description here
// You can write your code in this editor
//written by Gavin mills 10/19
if (!thisPlayer.isTalkingToPrisoner && keyboard_check_pressed(ord("F") ) ) {
	self.alarm[0] = 1;
	thisPlayer.isTalkingToPrisoner = true;
}//end if
//objDialogueBox.choice = true;
//displayPrisonerMenu();
//submitPrisonerAction();