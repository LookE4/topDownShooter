// Inherit the parent event
event_inherited();

dir = 0;
spd = 2;
xspd = 0;
yspd = 0;

//state control
state = 0;
// 0 = not moving and aim for the player, wait fot he enemy to shoot
// 1 = shoot twords the player

//cleanup
destroy = false;
player_destroy = true;