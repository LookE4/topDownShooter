//get inputs
right_key = global.right_key;
left_key = global.left_key;
up_key = global.up_key;
down_key = global.down_key;
shoot_key = global.shoot_key;
swap_key_pressed = global.swap_key_pressed;
start_key_pressed = global.start_key_pressed;
/*
	could change the shootkey to be pressed but it would be fatiuging and hard to balance
	can be done just not for this type of game
*/
//pause menu
if (start_key_pressed) {
	if (!instance_exists(obj_pause_menu)) {
		instance_create_depth(0, 0, 0, obj_pause_menu);
	} else {
		instance_destroy(obj_pause_menu);
	}
}

//pause self
if (screen_pause()) {
	exit;
}

#region MOVEMENT
	//get direction
	var _horiz_key = right_key - left_key;
	var _vert_key = down_key - up_key;
	move_dir = point_direction(0, 0, _horiz_key, _vert_key);
	
	//get the x and y speed
	var _spd = 0;
	var _input_lvl = point_distance(0, 0, _horiz_key, _vert_key);
	_input_lvl = clamp(_input_lvl, 0, 1);
	_spd = move_spd * _input_lvl;
	
	xspd = lengthdir_x(_spd, move_dir);
	yspd = lengthdir_y(_spd, move_dir);
	
	//colision horizontal
	if (place_meeting(x + xspd, y, obj_wall)) {
		xspd = 0;
	}
	
	//colision vertical
	if (place_meeting(x, y + yspd, obj_wall)) {
		yspd = 0;
	}
	
	//move the player
	x += xspd;
	y += yspd;
	
	//depth
	depth = -bbox_bottom;
#endregion

if (get_damage(obj_damage_player, true)) {
	//hit screen
	instance_create_depth(0, 0, 0, obj_hit_screen);
	
	//screen pasue
	create_screen_pause(25);
	
	//shake the screen
	screen_shake(6);
}

#region SPRITE
	//player aiming
	center_y = y + center_y_offset;
	
	//aim
	aim_dir = point_direction(x, center_y, mouse_x, mouse_y);

	//make sure the player is facing the right direction
	face = round(aim_dir / 90);
	if (face == 4) {
		face = 0;
	}

	//animate
	if (xspd == 0 && yspd == 0) {
		image_index = 0;
	}

	mask_index = sprite[3];
	//set the player sprite
	sprite_index = sprite[face];
#endregion

#region WEAPON SWAPPING
	var _player_weapons = global.inv_weapon;
	//cicle through weapons
	if (swap_key_pressed) {
		//change the selection and wrap around
		selected_weapon++;
		
		if (selected_weapon >= array_length(_player_weapons)) {
			selected_weapon = 0;
		}
	}
	
	//set the new weapn
	weapon = _player_weapons[selected_weapon];
#endregion

#region SHOOTING THE WEAPON
	if (shoot_timer > 0) {
		shoot_timer--;
	}

	if (shoot_key && shoot_timer <= 0) {
		//reset the timer
			shoot_timer = weapon.cooldown;
	
		//create bullet
			var _x_offset = lengthdir_x(weapon.length + weapon_offset_dist, aim_dir);
			var _y_offset = lengthdir_y(weapon.length + weapon_offset_dist, aim_dir);
			
			var _spread = weapon.spread;
			var _spread_div = _spread / max(weapon.bullet_num - 1, 1);
			
			var _weapon_tip_x = x + _x_offset;
			var _weapon_tip_y = center_y + _y_offset;
			
			//create the waepon flash
			create_animated_vfx(spr_shoot_flash, _weapon_tip_x, _weapon_tip_y, depth-10, aim_dir);
			
		//create the correct num of bullets	
			for (var i = 0; i < weapon.bullet_num; i++) {
				var _bullet_inst = instance_create_depth(_weapon_tip_x, _weapon_tip_y, depth-100, weapon.bullet_obj);
	
			//change the bullet direction
				with (_bullet_inst) {
					dir = other.aim_dir - _spread / 2 + _spread_div * i;
					
					//turn the bullet to the correct direction at creation if necesseray
					if (dir_fix) {
						image_angle = dir;
					}
				}
			}
	}
#endregion

#region DEATH
 if (hp <= 0) {
	//create the game over obj
	instance_create_depth(0, 0, -10000, obj_game_over_screen);
	 
	 //boom
	 create_animated_vfx(spr_small_boom, x, y, depth);
	 
	instance_destroy();
 }
 
#endregion