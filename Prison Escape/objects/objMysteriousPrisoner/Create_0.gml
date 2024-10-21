/// @description Insert description here
// You can write your code in this editor
//global.prisoner = new PrisonerDialogue(//pass player struct and obj dial) 
//refrence create for inkeeper and watchman workaround in ex
if ( !variable_instance_exists(objPlayer, "thisPlayer") ) {
	alarm[0] = 1;
} else {
	global.prisoner = new PrisonerDialogue(objPlayer.thisPlayer, objDialogueBox);
}//end if