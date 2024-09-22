//get cam coords
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

//central hud coordinates
var _border = 8;
var _hud_x = _cam_x + _border;
var _hud_y = _cam_y + _border;

//draw the players hp
if (instance_exists(obj_player)) {
	draw_sprite(spr_health_bar, 0, _hud_x, _hud_y);

	for(var i = 0; i < player_max_hp; i++) {
		//show current hp
		var _img = 1;
	
		if (i + 1 <= player_hp) {
			_img = 2;
		}
	
		var _sep = 3;
		draw_sprite(spr_health_bar, _img, _hud_x + _sep * i, _hud_y);
	}
} 

//draw the enemy kill count
var _enemycount_offset = 24;
var _ec_hud_x = _hud_x;
var _ec_hud_y = _hud_y + _enemycount_offset;

//draw the background/box
draw_sprite(spr_count_hud, 0, _ec_hud_x, _ec_hud_y);

//draw the text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_segoe);

//the current enemy kill count
draw_text_transformed(_ec_hud_x + 28, _ec_hud_y + 1, string(global.enemy_kill_count), .5, .5, 0);

//total enemys in level count
draw_text_transformed(_ec_hud_x + 50, _ec_hud_y + 1, "/" + string(global.enemy_room_max), .5, .5, 0);