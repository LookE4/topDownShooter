//screen pause
if (screen_pause()) {exit;}

//fade out
alpha -= alpha_spd;

if (alpha <= 0) {instance_destroy();}