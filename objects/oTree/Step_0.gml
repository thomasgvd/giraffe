if ((age > 15 && random(10) < age / 600) || (age > 50)) && (state != STATE.DEAD) {
	state = STATE.DEAD;
	ds_list_delete(global.trees, ds_list_find_index(global.trees, id));
}

if (state == STATE.DEAD) {
	deadTime++;
	image_xscale = max(0, image_xscale - 0.02);
	image_yscale = max(0, image_yscale - 0.02);
	if (deadTime > 30) instance_destroy();
} else {
	age += 0.1 * global.spd;
}