// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawBox(){
	//setDialogue();
	instance_create_layer(x,y,"Player",objDialogueBox);
	objDialogueBox.alarm[0]=1;
}