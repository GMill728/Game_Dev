// Play the main menu music if it's not already playing
if (!audio_is_playing(sndMainMenu)) {
    audio_play_sound(sndMainMenu, 1, true); // Loop the music
}