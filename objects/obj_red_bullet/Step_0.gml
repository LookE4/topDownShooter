//pause self
if (screen_pause()) {
	exit;
}


//move
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
	
	//detph
	depth = -y;
	
//cleanup
	//hit confirm destroy
		if (hit_confirm == true && enemy_destroy == true) {
			destory = true;
		}
	
	//destroy
		if (destory == true) {
			//shoot burst
			create_animated_vfx(spr_shoot_burst, x, y, depth-50);
			
			//destroy
			instance_destroy();
		}

	// collision
		if (place_meeting(x, y, obj_solid_wall)) {
			destory = true;
		}
		
	//bullet out of range
		if (point_distance(xstart, ystart, x, y) > max_dist) {
			destory = true;
		}