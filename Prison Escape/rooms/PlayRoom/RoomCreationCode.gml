// Play the main menu music if it's not already playing
if (!audio_is_playing(sndAmbience)) {
    audio_play_sound(sndAmbience, 1, true); // Loop the music
}