get_damage(obj_damage_parent);

//show damage
var _health_porcent = 1 - (hp/max_hp);
image_index = _health_porcent * image_number;

if (hp <= 0) {
	//boom
	create_animated_vfx(spr_small_boom, x + 8, y + 16, depth);
	
	//destroy
	instance_destroy();
}