// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function chiselCrack() {
	
	if (player.hasChisel && player.hasGuardDistracted) {
		dbox.setDialogue("A chip, chip, chip... and that's just enough to get out before the guard sees.\nCongratulations! You won!");
		objDialogueBox.alarm[1] = game_get_speed(gamespeed_fps) * 4; //Destroy the objDialogueBox in 4 seconds
	} else if (player.hasChisel && !player.hasGuardDistracted)  {
		dbox.setDialogue("[i]He'd hear me if I chiseled the wall... I have to do something first.[/i]");
	} else {
		dbox.setDialogue("[i]A crack in the wall... it has a small draft coming from it.[/i]");
	}//end if
	
}//end openDoor