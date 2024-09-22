//pause self
if (screen_pause()) {
	exit;
}

//float in place
float_dir += float_spd;
y = ystart + dsin(float_dir);
//dsin and lengthdir_y would be the same in this exemple

//get colelcted by the player
if (place_meeting(x, y, obj_player)) {
	//heal the player
	obj_player.hp += heal;
	
	//destroy self
	instance_destroy();
}