/// @description Insert description here
// You can write your code in this editor
if (display_text && alpha < 1) {
    alpha += fade_speed;
	//added a fade in 
}
if (fade_out && alpha > 0) {
    alpha -= fo_speed; 
    if (alpha <= 0) {
        alpha = 0;
        display_text = false; 
    }
}