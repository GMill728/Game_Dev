if ( !variable_instance_exists(objPlayer, "thisPlayer") ) {
	alarm[0] = 1;
} else {
	global.guard = new GuardDialogue(objPlayer.thisPlayer, objDialogueBox);
}//end if