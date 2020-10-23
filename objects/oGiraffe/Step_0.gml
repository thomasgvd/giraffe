if (state != STATE.DEAD) {
	hunger -= random_range(0.05, 0.15) * global.spd;
	if (age > 6) sexDrive += random_range(0.1, 0.3) * global.spd;
	age += 0.01 * global.spd;

	if (age > 22 && random(10) < age / 600) && (state != STATE.DEAD) {
		state = STATE.DEAD;
		ds_list_delete(global.giraffes, ds_list_find_index(global.giraffes, id));
		global.diedOfOldAge++;
	} else if (hunger <= 0) {
		state = STATE.DEAD;
		ds_list_delete(global.giraffes, ds_list_find_index(global.giraffes, id));
		global.diedOfHunger++;
	} else if (hunger < 50 && state != STATE.EATING) {
		state = STATE.SEARCHING_FOOD; 
	} else if (sexDrive > 50) {
		state = STATE.SEARCHING_MATE; 
	} else {
		state = STATE.IDLE; 
	}
} else {
	deadTime++;
	if (deadTime > 30) instance_destroy();
}

if (state != STATE.SEARCHING_FOOD) foundTree = false;
if (state != STATE.SEARCHING_MATE) foundMate = false;

switch (state) {
	case STATE.IDLE: IdleBehavior(); break;
	case STATE.SEARCHING_FOOD: SearchFoodBehavior(); break;
	case STATE.DEAD: DeadBehavior(); break;
	case STATE.SEARCHING_MATE: SearchingMateBehavior(); break;
	default: break;
}

x = clamp(x + xSpeed * global.spd, mBorder, room_width - mBorder);
y = clamp(y + ySpeed * global.spd, mBorder, room_width - mBorder);

var _scale = clamp(age / 10, 0.5, 1.5);

if (xSpeed < 0) image_xscale = -_scale; else if (state != STATE.DEAD) image_xscale = _scale;
image_yscale = _scale;