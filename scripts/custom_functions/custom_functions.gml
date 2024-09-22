//drawing the palyer's weapong
function draw_weapon(){
	//get the weapon off the player's body
	var _x_offset = lengthdir_x(weapon_offset_dist, aim_dir);
	var _y_offset = lengthdir_y(weapon_offset_dist, aim_dir);
	
	//flip the weapon upright
	var _weapon_y_scl = 1;
	if (aim_dir > 90 && aim_dir < 270) {
		_weapon_y_scl = -1;
	}

	draw_sprite_ext(weapon.sprite, 0, x + _x_offset, center_y + _y_offset, 1, _weapon_y_scl, aim_dir, c_white, image_alpha);
}

//vfx 
function screen_pause() {
	//pause self
	if (instance_exists(obj_screen_pause)) {
		image_speed = 0;
		
		return true;
	} else {
		image_speed = 1;
		
		return false;
	}
}
function create_screen_pause(_time = 3) {
		with (instance_create_depth(0, 0, 0, obj_screen_paused_timed)) {
		timer = _time;
	}
}
function screen_shake(_amount = 4) {
	with (obj_camera) {
		x_shake_amount = _amount;
		y_shake_amount = _amount;
	}
}
function create_animated_vfx(_sprite, _x, _y, _depth, _rot = 0) {
	with (instance_create_depth(_x, _y, _depth, obj_animated_vfx)) {
		sprite_index = _sprite;
		image_angle = _rot;
	}
}

//damage calc
	//damage create event
		function get_damage_create(_hp = 10, _iframes = false) {
			max_hp = _hp;
			hp = _hp;

			//get the iframes
			if (_iframes == true) {
				iframes_timer = 0;
				iframes_number = 90;
			}

			//create the damage lsit
			if (_iframes == false) {
				damage_list = ds_list_create();
			}
		}
		
	//damage cleanup event
		function get_damage_cleanup() {
			//DO NOT NEED IF IS USING IFRAMES	
			
			ds_list_destroy(damage_list);
		}

	//damage step event
		function get_damage(_damage_obj, _iframes = false) {
			//special exit for iframe timer
			if (_iframes && iframes_timer > 0) {
				iframes_timer--;
				
				//if iframe timer is cleanly divisable by 4 there will be no remainder and do the if
				//every 5 frames the code will run change the number will change the number of the frames
				if (iframes_timer mod 5 == 0) {
					if (image_alpha == 1) {
						image_alpha = 0;
					} else {
						image_alpha = 1;
					}
				}
				
				//clamp hp
				hp = clamp(hp, 0, max_hp);
				
				return false;
				//"exit" makes so the code down it isn't run it goes back to where the funtion was called
			}
			
			//make sure the iframe blinking sotps
			if (_iframes == true) {
				image_alpha = 1;
			}
			var _hit_confirm = false;
			//recive damage
				if (place_meeting(x, y, _damage_obj) 
				|| (_damage_obj != obj_damage_parent && place_meeting(x, y, obj_damage_all))) 
				{
					//getting a list of the damage instances
						//create ds list and copy instances to it
							var _inst_list = ds_list_create();
							instance_place_list(x, y, _damage_obj, _inst_list, false);
							
							if (_damage_obj != obj_damage_parent) {
								instance_place_list(x, y, obj_damage_all, _inst_list, false);
							
							}
						//get the size of our list
							var _list_size = ds_list_size(_inst_list);
			
						//looping throught the list
							for (var i = 0; i < _list_size; i++) {
								//get a damage obj instance from the list
									var _inst = ds_list_find_value(_inst_list, i);
				
								//check if this instance is already in the damage list
									if _iframes == true || (ds_list_find_index(damage_list, _inst) == -1) {
										//add the new damage instance to the damage list
											if (_iframes == false) {
												ds_list_add(damage_list, _inst);
											}
										//take damage from specific instance
											hp -= _inst.damage;
											_hit_confirm = true;
										//tell the damage instance it has impacted
											_inst.hit_confirm = true;
											
										//shoot burst
										if (_inst.hit_vfx) {
											create_animated_vfx(spr_shoot_burst, _inst.x, _inst.y, _inst.depth-50);
										}
									}
							}
							//set iframes if we were hit
							if (_iframes && _hit_confirm) {
								iframes_timer = iframes_number;
							}
							
							//free memory by destroying the ds list
								ds_list_destroy(_inst_list);

				}
		
				//clear the damage list of the objects that dont exists anymore or arent thouching anymor
					if (_iframes == false) {
						var _damage_list_size = ds_list_size(damage_list)
						for (var i = 0; i < _damage_list_size; i++) {
							//if not touching the damage instance anymore remove from the list and set the loop back to the 1 position
								var _inst = ds_list_find_value(damage_list, i);
								if (!instance_exists(_inst) || !place_meeting(x, y, _inst)) {
									ds_list_delete(damage_list, i);
									i--;
									_damage_list_size--;
								}
						}
					}
					
				//clamp hp
				hp = clamp(hp, 0, max_hp);
				
				return _hit_confirm;
		}