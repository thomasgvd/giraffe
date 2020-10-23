if ((age > 15 && random(10) < age / 600) || (age > 50)) && (state != STATE.DEAD) {
	state = STATE.DEAD;
	ds_list_delete(global.trees, ds_list_find_index(global.trees, id));
}

if (state == STATE.DEAD) {
	deadTime++;
	if (deadTime > 30) instance_destroy();
} else {
	age += 0.1 * global.spd;
}