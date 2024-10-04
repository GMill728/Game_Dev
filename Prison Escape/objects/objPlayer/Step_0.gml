//@Creator Griffin Nye
//@Modified by Wilfred

if (keyboard_check(ord("A")) )
{
	sprite_index = charWalkLeft;
	x -= 4;
} 
else if (keyboard_check(ord("D")) ) 
{
	sprite_index = charWalkRight;
	x += 4; 
} 
else if (keyboard_check(ord("S")) ) 
{
	sprite_index = charWalkDown;
	y += 4; 
} 
else if (keyboard_check(ord("W")) ) 
{
	sprite_index = charWalkUp;
	y -= 4; 
} 
else if (keyboard_check_released(ord("A")) ) {
	sprite_index = charIdleLeft;
} 
else if (keyboard_check_released(ord("D")) ) {
	sprite_index = charIdleRight;
} 
else if (keyboard_check_released(ord("S")) ) {
	sprite_index = charIdleDown;
} 
else if (keyboard_check_released(ord("W")) ) {
	sprite_index = charIdleUp;
}//end if
