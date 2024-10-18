/// @description Insert description here
// You can write your code in this editor
if (hasChisel && hasGuardDistracted && keyboard_check_pressed (ord("F")))
{
	layer_sequence_create("BelowPlayer", objCrackedWall.x, objCrackedWall.y, seqChiselWall);
	instance_destroy(objCrackedWall);
}