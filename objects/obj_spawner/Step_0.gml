//pause self
if (screen_pause()) {
	exit;
}

//spawn a  enemy
timer++;

//reset timer when enemy limit has been reach
if (instance_number(obj_enemy_parent) >= global.active_enemy_max || global.total_enemy_spawned >= global.enemy_room_max) {
	timer = 0;	
}

if (timer >= spawn_time && !place_meeting(x, y + 16, obj_zombie)) {
	var _inst = instance_create_depth(x, y, depth-1, obj_zombie);
	with (_inst) {
		//make the zombie inv
		image_alpha = 0;
		state = -1;
	}
	
	//reset the timer
	timer = 0;
}