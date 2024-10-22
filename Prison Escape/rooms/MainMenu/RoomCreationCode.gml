// Play the main menu music if it's not already playing
if (!audio_is_playing(sndRain)) {
    audio_play_sound(sndRain, 1, true); // Loop the music
}