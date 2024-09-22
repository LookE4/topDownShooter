//function off drawing the weapon
	if (aim_dir >= 0 && aim_dir < 180) {
		draw_weapon();
	}

//draw myself
	draw_self();

//function off drawing the weapon
	if (aim_dir >= 180 && aim_dir < 360) {
		draw_weapon();
	}