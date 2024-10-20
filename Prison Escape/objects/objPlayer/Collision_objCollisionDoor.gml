/// @description Insert description here
// You can write your code in this editor
//written by gavin mills 10/19
if (!global.disableGuard && !isTalkingToGuard && keyboard_check_pressed(ord("F") ) ) {
	self.alarm[0] = 1;
	isTalkingToGuard = true;
}//end if