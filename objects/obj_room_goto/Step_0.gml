if (instance_exists(obj_player)) {
	if (global.enemy_room_max == global.enemy_kill_count) {
		if (place_meeting(x, y, obj_player)) {
			room_goto_next(); 
		}
	} 
}