//damage setup
	get_damage_create(20, true);

//var for movement
	move_dir = 0;
	move_spd = 2;
	xspd = 0;
	yspd = 0;

//sprite control
	center_y_offset = -5;
	center_y = y + center_y_offset;//set in step event
	
	weapon_offset_dist = 4;
	aim_dir = 0;

	face = 3;
	sprite[0] = spr_player_right;
	sprite[1] = spr_player_up;
	sprite[2] = spr_player_left;
	sprite[3] = spr_player_down;
	
//weapon info
	//var to not put more than one ang weapon
	ang_count = false;
	shoot_timer = 0;
	
	//add weapon to player
	array_push(global.inv_weapon, global.weapon_list.red_rod);

	
	selected_weapon = 0;
	weapon = global.inv_weapon[selected_weapon];