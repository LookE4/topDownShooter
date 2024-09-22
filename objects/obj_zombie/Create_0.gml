// Inherit the parent event
event_inherited();

spd = 0;
chase_spd = .5;
dir = 0;
xspd = 0;
yspd = 0;
face = 1;

//state machine
state = 0;
	//spawn from mausoleum state
	fade_speed = 1/15;
	emerge_speed = .25;
	
	//shooting state
	cooldown_time = 4*60;
	shoot_timer = irandom(cooldown_time);
	windup_time = 60;
	recover_time = 45;
	bullet_inst = noone;
	
	bullet_x_offset = 5;
	bullet_y_offset = -8;