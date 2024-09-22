get_damage(obj_damage_enemy);

//death
	if (hp <= 0) {
		//add to the toatal amount of enemy killed
		global.enemy_kill_count++;
		
		//determine if we should drop an item
		if (global.enemy_kill_count mod 30 == 0) {
			instance_create_depth(x, y, depth, obj_heart);
		}
		
		//boom vfx
		create_animated_vfx(spr_small_boom, x, y, depth);
		
		//destroy self
		instance_destroy();
	}