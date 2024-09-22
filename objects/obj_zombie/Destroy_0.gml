//get rid of bullet of bullet if we have not shot it yet
if (instance_exists(bullet_inst) && bullet_inst.state == 0) {
	bullet_inst.destroy = true;
}