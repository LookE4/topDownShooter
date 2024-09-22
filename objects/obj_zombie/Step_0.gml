//pause self
if (screen_pause()) {
	exit;
}

//code commands
var _wall_collisions = true;
var _get_damage = true;

//state machine 
switch (state) {
	case -1: 
	#region SPAWN IN FROM MAUSOLEUM
		//fade in the most fuck way to spawn 
		if (image_alpha < 1) {
			//dont walk while fading in
			spd = 0;
			image_alpha += fade_speed;
		}
		
		//walk out
		_wall_collisions = false;
		_get_damage = false;
		
		if (image_alpha >= 1) {
			//set the right speed and direction
			spd = emerge_speed;
			dir = 270;
		}
		
		//switch into the chasing state after of spawner wall
		if (!place_meeting(x, y, obj_wall)) {
			state = 0;
		}
	#endregion
	break;
	case 0:
	#region CHASE THE PLAYER
		//chase the player
		//player x and y
		if (instance_exists(obj_player)) {
			dir = point_direction(x, y, obj_player.x, obj_player.y);
		}
				
		//set the correct speed
		spd = chase_spd;
				
		//trasintion to shooting state
		var _cam_left = camera_get_view_x(view_camera[0]);
		var _cam_right = _cam_left + camera_get_view_width(view_camera[0]);
		var _cam_top = camera_get_view_y(view_camera[0]);
		var _cam_bottom = _cam_top + camera_get_view_height(view_camera[0]);
				
		//only add to the timer if we are on screen
		if (bbox_right > _cam_left && bbox_left < _cam_right && bbox_bottom > _cam_top && bbox_top < _cam_bottom) {
			shoot_timer++;
		}
		if (shoot_timer > cooldown_time) {
			//go to shoot stte
			state = 1;
			//reset the timer so shooting state can use it too
			shoot_timer = 0;
		}
		#endregion
	break;
	case 1:
	#region BULLET SHOOTING AND VISUALS
		if (instance_exists(obj_player)) {
			dir = point_direction(x, y, obj_player.x, obj_player.y);
		}		
			
		//setting the correct speed
		spd = 0;
			
		//stop animating
		image_index = 0;
			
		//shoot a bullet
		shoot_timer++;
			
		//create the bullet
		if (shoot_timer == 1) {
			bullet_inst = instance_create_depth(x + bullet_x_offset * face, y + bullet_y_offset, depth, obj_enemy_bullet);	
		}
			
		//keep the bullet in the zombies hand
		if (shoot_timer <= windup_time && instance_exists(bullet_inst)) {
			bullet_inst.x = x + bullet_x_offset * face;
			bullet_inst.y = y + bullet_y_offset;
		}
			
		//shoot the bullet after the windup time is over
		if (shoot_timer == windup_time && instance_exists(bullet_inst)) {
			//set our bullet's state to the movement state
			bullet_inst.state = 1;
		}
			
		//recover and return to chasing the player
		if (shoot_timer > windup_time + recover_time) {
			//go back to chasing the player
			state = 0;
			//reset the timer so qe can use it again
			shoot_timer = 0;
		}
		#endregion
	break;
	}

//getting the speeds
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);
		
//get the correct face
	if (dir > 90 && dir < 270) {
		face = -1;
	} else {
		face = 1;
	}

//collisions for wall
//colision horizontal
if (_wall_collisions) {
	if (place_meeting(x + xspd, y, obj_wall)) {
		xspd = 0;
	}
	
//colision vertical
	if (place_meeting(x, y + yspd, obj_wall)) {
		yspd = 0;
	}
}
//enemy collistion
if (place_meeting(x + xspd, y, obj_enemy_parent)) {
	xspd = 0;
}
	
if (place_meeting(x, y + yspd, obj_enemy_parent)) {
	yspd = 0;
}
	
//moving
	x += xspd;
	y += yspd;
		
//set teh depth
	depth = -y;

//getting damaged and dying
if (_get_damage) {
	// Inherit the parent event
	event_inherited();
}