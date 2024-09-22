get_damage(obj_damage_parent);

//show damage
var _health_porcent = 1 - (hp/max_hp);
image_index = _health_porcent * image_number;

if (hp <= 0) {
	//create explosion
	instance_create_depth(x + 8, y + 8, -3000, obj_big_boom);
	
	//screen pause
	create_screen_pause();
	
	//screen shake
	screen_shake(8);
	
	//destroy self
	instance_destroy();
}