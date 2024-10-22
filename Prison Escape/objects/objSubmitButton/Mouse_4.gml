/// @description Goto play area

event_inherited();

global.name = objTextSubmit.text;

if (audio_is_playing(sndMainMenu)) {
    audio_stop_sound(sndMainMenu);  // Stop the main menu music
<<<<<<< HEAD
	audio_stop_sound(sndRain);
}

=======
	audio_stop_sound(sndRain); //Stop the rain SFX
}
>>>>>>> f83abe3f70392dfc721333651436f6ebba23f0f9
room_goto(PlayRoom);