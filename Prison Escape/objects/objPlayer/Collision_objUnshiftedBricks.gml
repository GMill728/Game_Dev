/// @description Insert description here
// You can write your code in this editor
if (hasChiselLocation && keyboard_check_pressed (ord("F")))
{
	layer_sequence_create("BelowPlayer", objUnshiftedBricks.x, objUnshiftedBricks.y, seqMoveBricks);
	instance_destroy(objUnshiftedBricks);
}