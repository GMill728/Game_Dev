/// @description Insert description here
// You can write your code in this editor
if(thisPlayer.hasTalkedToPrisoner && thisPlayer.hasGuardDistracted && keyboard_check_pressed( ord("F") ) ) {
	drawBox();
	objDialogueBox.setDialogue("You slip through the cracks in the wall, escaping the prison once and for all.");
	// Play the main menu music if it's not already playing
	if (!audio_is_playing(sndMainMenu)) {
		audio_play_sound(sndMainMenu, 1, false); 
	}
	hasWon = true; //Indicate Player has won
}