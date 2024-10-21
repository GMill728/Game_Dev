/// @description Insert description here
// You can write your code in this editor
thisPlayer.hasChisel = true;	
global.prisoner.unlocksPrisoner(2);
instance_destroy(other);
drawBox();
objDialogueBox.setDialogue("***You found the chisel!***");
global.prisonerDialogueBranch = 2;