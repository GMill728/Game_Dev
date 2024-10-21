/// @description Handles submitting player choices to the appropriate dialogue branch script
if (choice) {
	
	
	if(objPlayer.thisPlayer.isTalkingToPrisoner) {
		//drawBox();
		global.prisoner.submitPrisonerAction(selected);
	} else if (objPlayer.thisPlayer.isTalkingToGuard) {
		//drawBox();
		global.guard.submitGuardAction(selected);
	}
	//} else if (objPlayer.thisPlayer.isInspecting) {
	//	//drawBox();
	//	submitInspectAction(selected);
	//} else {
		
	//	//Prevent Innkeeper option from being selected while disabled
	//	//NOTE: Will be deprecated after movmement & collision
	//if (objPlayer.thisPlayer.prisonerDisabled && selected == 3) {
	//		selected = -1;
	//	}//end if
	
		//submitPlayerAction(selected);
		//end if
	
} 

//else { //If no choices presented, display Actions Menu by default
	
//	displayActionsMenu();
	
//}//end if
