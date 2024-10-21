/// @description Handles submitting player choices to the appropriate dialogue branch script
if (choice) {
	
	
	if(Player.isTalkingToPrisoner) {
		//drawBox();
		submitPrisonerAction(selected);
	} else if (Player.isTalkingToGuard) {
		//drawBox();
		submitGuardAction(selected);
	} else if (Player.isInspecting) {
		//drawBox();
		submitInspectAction(selected);
	} else {
		
		//Prevent Innkeeper option from being selected while disabled
		//NOTE: Will be deprecated after movmement & collision
	if (prisonerDisabled && selected == 3) {
			selected = -1;
		}//end if
	
		submitPlayerAction(selected);
		
	}//end if
	
} 

//else { //If no choices presented, display Actions Menu by default
	
//	displayActionsMenu();
	
//}//end if
