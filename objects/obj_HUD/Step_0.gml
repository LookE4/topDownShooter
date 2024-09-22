//get the players hp info
if (instance_exists(obj_player)) {
	player_hp = obj_player.hp;
	player_max_hp = obj_player.max_hp;
} else {
	player_hp = 0;
}