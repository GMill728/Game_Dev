// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player(objInstance, movSpd, mnDepth, mxDepth) constructor{
	
	instance = objInstance
	
	
	//Game variables
	hasKey = false;//do not use
	hasCash = false;//do not use
	hasInfluencedGuard = false; //do not use
	isSearchingForCash = false;//do not use
	hasReceivedKeyLocation = false;//do not use
	isTalkingToGuard = false;
	isTalkingToPrisoner = false;
	hasStone = false;
	hasChisel = false;
	hasGuardDistracted = false;
	hasChiselLocation = false;
	hasStoneLocation = false;
	isInspecting = false;
	hasTalkedToPrisoner = false;
	//hasWon = false;
	//movement variables
	hsp = 0;
	vsp = 0; 
	moveSpeed = movSpd; 
	//depth variables
	minDepth = mnDepth;
	maxDepth = mxDepth;
	
	function control() {
		//Set appropriate sprite and movement based on user input
		if (keyboard_check(ord("A")) ) {
			instance.sprite_index = charWalkLeft;
			hsp = -moveSpeed;
		} 
		if (keyboard_check(ord("D")) ) {
			instance.sprite_index = charWalkRight;
			hsp = moveSpeed; 
		} 
		if (keyboard_check(ord("S")) ) {
			instance.sprite_index = charWalkDown;
			vsp = moveSpeed; 
		} 
		if (keyboard_check(ord("W")) ) {
			instance.sprite_index = charWalkUp;
			vsp = -moveSpeed; 
		}

		// Handle idle animations when movement keys are released
		if (keyboard_check_released(ord("A")) ) {
			instance.sprite_index = charIdleLeft;
			vsp = 0;
			hsp = 0;
		} 
		else if (keyboard_check_released(ord("D")) ) {
			instance.sprite_index = charIdleRight;
			vsp = 0;
			hsp = 0;
		} 
		else if (keyboard_check_released(ord("S")) ) {
			instance.sprite_index = charIdleDown;
			vsp = 0;
			hsp = 0;
		} 
		else if (keyboard_check_released(ord("W")) ) {
			instance.sprite_index = charIdleUp;
			vsp = 0;
			hsp = 0;
		}
	}//end control inputs
	
	
	//function for stopping movement during dialogue
	function move(){
		if(!isTalkingToGuard && !isTalkingToPrisoner) {
			with (instance) {
				x = clamp(x + other.hsp, x - bbox_left, room_width - (bbox_right - x));
				y = clamp(y + other.vsp, y - bbox_top, room_height - (bbox_bottom - y));
			}//end with
		}//end if
	}//end move
	
	function enforceCollisions(objectType) {
		
		if (isCollidingHorizontal(objectType)) {
			hsp = 0;  // Stop horizontal movement if colliding
		} else if (isCollidingVertical(objectType)) {
			vsp = 0;  // Stop vertical movement if colliding
		}
	
	}//end enforceCollisions
	
	function isCollidingHorizontal(objectType) {
    // Player bounding box height calculation
		with(instance){
	
			var playerHeight = bbox_bottom - bbox_top;
			var playerKnee = bbox_bottom - ceil(playerHeight/4); // Player Collision Point when approaching from bottom (moving up)

			// Check for left movement collision
			if (other.hsp < 0 && position_meeting(bbox_left, y, objectType) && position_meeting(bbox_left, playerKnee, objectType)) {
				return true; // Collision when moving left
			} 
			// Check for right movement collision
			else if (other.hsp > 0 && position_meeting(bbox_right - 1, y, objectType) && position_meeting(bbox_right - 1, playerKnee, objectType)) {
				return true; // Collision when moving right
			}
		}//end with
	return false;  // No collision
	
	}// end horizontal collision
	

	
	function isCollidingVertical(objectType) {
    // Player bounding box height calculation
    
		with(instance) {
		
			var playerHeight = bbox_bottom - bbox_top;
			var playerKnee = bbox_bottom - ceil(playerHeight/4); // Player Collision Point when approaching from bottom (moving up)

			// Check for upward movement collision
			if (other.vsp < 0 && collision_line(bbox_left, playerKnee + other.vsp, bbox_right, playerKnee + other.vsp, objectType, false, true) != noone 
	                && collision_line(bbox_left, y + other.vsp, bbox_right, y + other.vsp, objectType, false, true) != noone ) {
				return true; // Collision when moving up
			} 
			// Check for downward movement collision
			else if (other.vsp > 0 && collision_line(bbox_left, y + other.vsp, bbox_right, y + other.vsp, objectType, false, true) != noone 
	                     && collision_line(bbox_left, playerKnee + other.vsp, bbox_right, playerKnee + other.vsp, objectType, false, true) != noone ) {
				return true; // Collision when moving down
			}//end if
		}//end with
   return false; // No collision
}//end vertical collision
	
	
function determineDepth(objectType) {	
	instance.depth = isAboveClosestInstance(objectType) ? maxDepth : minDepth;
}//end determineDepth
	

function isAboveClosestInstance(objectType) {
    if (instance_number(objectType) == 0) {
        // If there are no collision objects, return a default depth
        return false;
	}

    // Find the closest instance of the collision mask
    var closestInstance = instance_find(objectType, 0);
    var minDist = distance_to_object(closestInstance);

    // Loop through all instances of the collision mask and find the closest one
    for (var i = 1; i < instance_number(objectType); i++) {
        var currInstance = instance_find(objectType, i);
        
		with(instance) {
			var dist = distance_to_object(currInstance);
		}//end with

        if (dist < minDist) {
            minDist = dist;
            closestInstance = currInstance;
        }
    }

    // Return whether the player is above the closest instance (for depth adjustment)
    return instance.y < closestInstance.y;
	}
}	