//pause self
if (screen_pause()) {
	exit;
}

//create damage objesct
if (created_damage_objects == false) {
	//create an obj to damage enemys
	damage_inst = instance_create_depth(x, y, 0, obj_damage_all);
	with (damage_inst) {
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}

//set created variable to true so we dont make a bunch of damage objects
	created_damage_objects = true;
}

//get rid of the damage objects once theyre done
if (image_index >= 2) {
	//destroy enemy
	if (instance_exists(damage_inst)) {
		instance_destroy(damage_inst);
	}
}