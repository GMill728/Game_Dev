/// @description Insert description here
// You can write your code in this editor

if (thisPlayer.hasStoneLocation && keyboard_check_pressed (ord("F")))
{
	layer_sequence_create("BelowPlayer", objHay.x, objHay.y, seqFindStone);
	instance_destroy(objHay);
}