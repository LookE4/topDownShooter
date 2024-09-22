//draw over the camear
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, 0, _cam_x, _cam_y, 1, 1, 0, c_white, alpha);