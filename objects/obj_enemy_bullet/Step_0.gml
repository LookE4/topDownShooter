//pause self
if (screen_pause()) {
	exit;
}

//state machine
switch (state) {
	//wait for enemy to shoot state
	case 0:
		//aim for the player
		if (instance_exists(obj_player)) {
			dir = point_direction(x, y, obj_player.x, obj_player.center_y);
		}
		
		//set depth to make myself more visible
		depth = -y - 50;
	break;
	//shoot / travel
	case 1:
		//movement
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;
		
		//updated depth
		depth = -y;
	break;
}

//cleanup
//out of room bounds
var _pad = 16;
if (bbox_right < - _pad || bbox_left > room_width + _pad || bbox_bottom < - _pad || bbox_top > room_height + _pad) {
	destroy = true;
}

if (hit_confirm && player_destroy) { 
	destroy = true;
}

if (destroy) {
	//shoot burst
	create_animated_vfx(spr_shoot_burst, x, y, depth-50);
	
	instance_destroy();
}

if (place_meeting(x, y, obj_solid_wall)) {
	destroy = true;
}