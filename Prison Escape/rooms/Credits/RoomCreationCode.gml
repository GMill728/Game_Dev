// Play the main menu music if it's not already playing
if (!audio_is_playing(sndCredits)) {
    audio_play_sound(sndCredits, 1, true); // Loop the music
}