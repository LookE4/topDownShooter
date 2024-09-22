depth = -y;

//floating
float_dir = 0;
float_spd = 8;

//set the weapon based on the image index in the room editor
if (image_index == 0) {
	weapon = global.weapon_list.blue_rod;
}
if (image_index == 1) {
	weapon = global.weapon_list.purple_rod;
}
if (image_index == 2) {
	weapon = global.weapon_list.angelical_rod;
}

//set the correct sprite
sprite_index = weapon.pickup_sprite;
image_index = 0;