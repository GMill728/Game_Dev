/// @description Insert description here
// You can write your code in this editor
//written by gavin mills 10/19
if (!thisPlayer.disableGuard && !thisPlayer.isTalkingToGuard && keyboard_check_pressed(ord("F") ) ) {
	self.alarm[0] = 1;
	thisPlayer.isTalkingToGuard = true;
}//end if