//pause self
if (screen_pause()) {
	exit;
}

//float in place
float_dir += float_spd;
y = ystart + dsin(float_dir);

if (place_meeting(x, y, obj_player)) {
	array_push(global.inv_weapon, weapon);
	
	//set as the player weapon
	obj_player.selected_weapon = array_length(global.inv_weapon) - 1; 
	
	//destroy self
	instance_destroy();
}