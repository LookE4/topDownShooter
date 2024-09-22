//draw the enemy to the right position to face the player
draw_sprite_ext(sprite_index, image_index, x , y, face, image_yscale, image_angle, image_blend, image_alpha);

//draw the hp
//draw_text(x, y, string(hp));
var _health_porcent = hp / max_hp;
var _hp_image = _health_porcent * (sprite_get_number(spr_enemy_health) - 1);
draw_sprite_ext(spr_enemy_health, _hp_image, x, y - sprite_height - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);