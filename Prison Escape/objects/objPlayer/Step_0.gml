//@Creator Griffin Nye
//@Modified by Wilfred


var vsp = 0; 
var hsp = 0; 

if (keyboard_check(ord("A")) )
{
	sprite_index = charWalkLeft;
	hsp = -moveSpeed;
} 
else if (keyboard_check(ord("D")) ) 
{
	sprite_index = charWalkRight;
	hsp = moveSpeed; 
} 
else if (keyboard_check(ord("S")) ) 
{
	sprite_index = charWalkDown;
	vsp = moveSpeed; 
} 
else if (keyboard_check(ord("W")) ) 
{
	sprite_index = charWalkUp;
	vsp = -moveSpeed; 
} 

//Handle character idle animations
if (keyboard_check_released(ord("A")) ) {
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

//collisions with objWall

if(place_meeting(x + hsp, y, objWallCollision)) {
	hsp = 0; 
}

if(place_meeting(x, y + vsp, objWallCollision)){
	vsp = 0; 
}

x += hsp; 
y += vsp; 