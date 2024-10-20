/// @description Insert description here
// You can write your code in this editor
if(keyboard_lastkey == vk_up) {
	sprite_index = sprPlayerIdleUp;
} else if (keyboard_lastkey == vk_down) {
	sprite_index = sprPlayerIdleDown;
} else if (keyboard_lastkey == vk_right) {
	sprite_index = sprPlayerIdleRight;
} else if (keyboard_lastkey == vk_left) {
	sprite_index = sprPlayerIdleLeft;
}//end if

//Destroy any existing instances of objDialogueBox
if( instance_exists(objDialogueBox) ) {
	instance_destroy(objDialogueBox);
}//end if

//Create new objDialogueBox at (0,-64) on DialogueBox layer
drawBox();

//Display appropriate dialogue in objDialogueBox
if(isTalkingToGuard) {
	displayGuardMenu();
} else if (isTalkingToPrisoner) {
	displayPrisonerMenu();
}//end if