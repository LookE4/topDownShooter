var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_w = camera_get_view_width((view_camera[0]));
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

//draw a black rectangle over the screen
draw_set_alpha(alpha * alpha_max);
draw_rectangle_color(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + _cam_h, c_black ,c_black ,c_black ,c_black, 0);

//draw the text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(fnt_segoe);

//game over
var _gameover_offset = -32;
draw_text_transformed(_cam_x + _cam_w/2, _cam_y + _cam_h/2 + _gameover_offset, "Game Over", 3, 3, 0);

//press shoot to restart
var _restart_offset = 80;
draw_text_transformed(_cam_x + _cam_w/2, _cam_y + _cam_h/2 + _restart_offset, "~ Press Shoot to Restart ~", 1, 1, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);