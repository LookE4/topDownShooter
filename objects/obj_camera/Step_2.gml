//get the cameras width and heigh
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

//center on the player
if (instance_exists(obj_player)) {
	x = obj_player.x - _cam_w/2;
	y = obj_player.center_y - _cam_h/2;
}

//camera shaking

//xshake
if (x_shake_amount > 0) {
	x_shake_dir += x_shake_dir_spd;
	x_shake_amount -= x_shake_amount_spd;
} else {
	x_shake_amount = 0;
	x_shake_dir = 0;
}

x_shake = dsin(x_shake_dir) * x_shake_amount;

// y shake
if (y_shake_amount > 0) {
	y_shake_dir += y_shake_dir_spd;
	y_shake_amount -= y_shake_amount_spd;
} else {
	y_shake_amount = 0;
	y_shake_dir = 0;
}

y_shake = dsin(y_shake_dir) * y_shake_amount;
	
//add in the camera shake
x += x_shake;
y += y_shake;

//clamp cam position to room borders
x = clamp(x ,0, room_width - _cam_w);
y = clamp(y, 0, room_height - _cam_h);

//set the camera posicion
camera_set_view_pos(view_camera[0], x, y);