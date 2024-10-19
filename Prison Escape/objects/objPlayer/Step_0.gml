//@Creator Griffin Nye
//@Modified by Wilfred
//  Edited by gavin 10/19

// Initialize horizontal and vertical movement speeds
vsp = 0; 
hsp = 0; 

// Handle movement inputs
if (keyboard_check(ord("A")) ) {
    sprite_index = charWalkLeft;
    hsp = -moveSpeed;
} 
else if (keyboard_check(ord("D")) ) {
    sprite_index = charWalkRight;
    hsp = moveSpeed; 
} 
else if (keyboard_check(ord("S")) ) {
    sprite_index = charWalkDown;
    vsp = moveSpeed; 
} 
else if (keyboard_check(ord("W")) ) {
    sprite_index = charWalkUp;
    vsp = -moveSpeed; 
}

// Handle idle animations when movement keys are released
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
}

// Check for horizontal and vertical collisions separately
if (isCollidingHorizontal()) {
    hsp = 0;  // Stop horizontal movement if colliding
}

if (isCollidingVertical()) {
    vsp = 0;  // Stop vertical movement if colliding
}

// Move the player based on horizontal and vertical speeds
x += hsp; 
y += vsp; 

// Adjust the player's depth dynamically based on proximity to collision objects
depth = isAboveClosestInstance(objParentCollision) ? 550 : 0;

// Debug messages for tracking player depth and y-coordinate
show_debug_message("Player depth: " + string(depth));
show_debug_message("Player y-coordinate: " + string(y));

