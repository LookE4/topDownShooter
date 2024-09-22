//cunstroctur template for weapons
function CreateWeapon(
		_sprite = spr_red_rod, 
		_length = 0, 
		_bullet_obj = obj_red_bullet, 
		_cooldown = 1, 
		_bullet_num = 0,
		_spread = 0,
		_pickup_sprite = spr_red_rod_pickup) constructor {
	
	sprite = _sprite;
	length = _length;
	bullet_obj = _bullet_obj;
	cooldown = _cooldown;
	bullet_num = _bullet_num;
	spread = _spread;
	pickup_sprite = _pickup_sprite;
}
//inventory of weapons 
global.inv_weapon = array_create(0);

//the weapons
global.weapon_list = {
	red_rod : new CreateWeapon(spr_red_rod, 
					sprite_get_bbox_right(spr_red_rod) - sprite_get_xoffset(spr_red_rod),
					obj_red_bullet,
					9,
					1,
					0,
					spr_red_rod_pickup
					),
				
	blue_rod : new CreateWeapon(spr_blue_rod, 
					sprite_get_bbox_right(spr_blue_rod) - sprite_get_xoffset(spr_blue_rod),
					obj_yellow_bullet,
					6,
					1,
					0,
					spr_blue_rod_pickup
					),
	purple_rod : new CreateWeapon(spr_purple_rod, 
					sprite_get_bbox_right(spr_purple_rod) - sprite_get_xoffset(spr_purple_rod),
					obj_purple_bullet,
					16,
					7,
					80,
					spr_purple_rod_pickup
					),
	angelical_rod : new CreateWeapon(spr_angelical_rod, 
					sprite_get_bbox_right(spr_angelical_rod) - sprite_get_xoffset(spr_angelical_rod),
					obj_angelical_bullet,
					0,
					1,
					0,
					spr_angelical_rod_pickup
					),
}