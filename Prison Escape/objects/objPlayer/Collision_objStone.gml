/// @description Insert description here
// You can write your code in this editor
thisPlayer.hasStone = true;	
global.prisoner.unlocksPrisoner(1);
instance_destroy(other);
drawBox();
objDialogueBox.setDialogue("***You found the stone!***");
global.prisonerDialogueBranch = 1;