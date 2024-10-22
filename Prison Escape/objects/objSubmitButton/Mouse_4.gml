/// @description Goto play area

event_inherited();

global.name = objTextSubmit.text;

if (audio_is_playing(sndMainMenu)) {
    audio_stop_sound(sndMainMenu);  // Stop the main menu music
	audio_stop_sound(sndRain); //Stop the rain SFX
}
room_goto(PlayRoom);