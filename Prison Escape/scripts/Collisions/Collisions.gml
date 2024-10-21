//@Modified by Wilfred

/// @func isCollidingVertical()
/// @desc Returns whether or not the Player object is colliding with the top or bottom of a custom collision box 
///       enforced on the objCollisionMask in order to create a 2.5D effect (2D with player depth)
//function isCollidingVertical() {
//    // Player bounding box height calculation
//    var playerHeight = bbox_bottom - bbox_top;
//    var playerKnee = bbox_bottom - ceil(playerHeight/4); // Player Collision Point when approaching from bottom (moving up)

//    // Check for upward movement collision
//    if (vsp < 0 && collision_line(bbox_left, playerKnee + vsp, bbox_right, playerKnee + vsp, objParentCollision, false, true) != noone 
//                && collision_line(bbox_left, y + vsp, bbox_right, y + vsp, objParentCollision, false, true) != noone ) {
//        return true; // Collision when moving up
//    } 
//    // Check for downward movement collision
//    else if (vsp > 0 && collision_line(bbox_left, y + vsp, bbox_right, y + vsp, objParentCollision, false, true) != noone 
//                     && collision_line(bbox_left, playerKnee + vsp, bbox_right, playerKnee + vsp, objParentCollision, false, true) != noone ) {
//        return true; // Collision when moving down
//    }

//    return false; // No collision
//}

/// @func isCollidingHorizontal()
/// @desc Returns whether or not the Player object is colliding with the left or right of a custom collision box
///       enforced on the objCollisionMask in order to create a 2.5D effect (2D with player depth)
//function isCollidingHorizontal() {
//    // Player bounding box height calculation
//    var playerHeight = bbox_bottom - bbox_top;
//    var playerKnee = bbox_bottom - ceil(playerHeight/4); // Player Collision Point when approaching from bottom (moving up)


//    return false;  // No collision
//}

/// @func isAboveClosestInstance(collisionMasks)
/// @desc Finds the closest instance of the specified collision mask type to objPlayer
///       and returns whether or not objPlayer is found above said closest instance in the room.
//function isAboveClosestInstance(collisionMasks) {
//    if (instance_number(collisionMasks) == 0) {
//        // If there are no collision objects, return a default depth
//        return false;
//    }

//    // Find the closest instance of the collision mask
//    var closestInstance = instance_find(collisionMasks, 0);
//    var minDist = distance_to_object(closestInstance);

//    // Loop through all instances of the collision mask and find the closest one
//    for (var i = 1; i < instance_number(collisionMasks); i++) {
//        var currInstance = instance_find(collisionMasks, i);
//        var dist = distance_to_object(currInstance);

//        if (dist < minDist) {
//            minDist = dist;
//            closestInstance = currInstance;
//        }
//    }

//    // Return whether the player is above the closest instance (for depth adjustment)
//    return y < closestInstance.y;
//}

