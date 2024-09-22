//get the shootkey
shoot_key = global.shoot_key;

//fade in code
alpha += alpha_speed;
alpha = clamp(alpha, 0, 1);

//restart 
if (shoot_key && alpha >= 1) {
	room_restart();
}