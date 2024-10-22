<<<<<<< HEAD
// Play the main menu music if it's not already playing
=======
>>>>>>> f83abe3f70392dfc721333651436f6ebba23f0f9
if (!audio_is_playing(sndAmbience)) {
    audio_play_sound(sndAmbience, 1, true); // Loop the music
}