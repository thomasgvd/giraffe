state = STATE.IDLE;

hunger = 100;
sexDrive = 0;
neckSize = random_range(8, 12);
gender = choose(GENDER.MALE, GENDER.FEMALE);
mateGender = gender == GENDER.MALE ? GENDER.FEMALE : GENDER.MALE;
moveSpeed = 3;
xSpeed = 0;
ySpeed = 0;
foundTree = false;
foundMate = false;
age = random_range(2,12);
deadTime = 0;

xTo = randomX;
yTo = randomY;

neckSet = false;

function At(_x, _y) {
	var _border = 10;
	var _atX = x > _x - _border && x < _x + _border;
	var _atY = y > _y - _border && y < _y + _border;
	
	return _atX && _atY;
}

function GenderText() {
	
	var text = "";
	
	switch (gender) {
		case GENDER.MALE: text = "male"; break;
		case GENDER.FEMALE: text = "female"; break;
		default: break;
	}
	
	return text;
}

function StateText() {
	
	var text = "";
	
	switch (state) {
		case STATE.IDLE: text = "idle"; break;
		case STATE.SEARCHING_FOOD: text = "searching food"; break;
		case STATE.EATING: text = "eating"; break;
		case STATE.BREEDING: text = "breeding"; break;
		case STATE.FIGHTING: text = "fighting"; break;
		case STATE.DEAD: text = "dead"; break;
		case STATE.SEARCHING_MATE: text = "searching mate"; break;
		default: break;
	}
	
	return text;
}

function IdleBehavior() {
	if (!At(xTo, yTo)) {
		xSpeed = lengthdir_x(moveSpeed, point_direction(x, y, xTo, yTo));
		ySpeed = lengthdir_y(moveSpeed, point_direction(x, y, xTo, yTo));
	} else {
		xTo = randomX;
		yTo = randomY;
	}
}

function SearchFoodBehavior() {
	
	if (!instance_exists(foundTree)) foundTree = false;
	
	if (foundTree) {
		if (!At(xTo, yTo)) {
			xSpeed = lengthdir_x(moveSpeed, point_direction(x, y, xTo, yTo));
			ySpeed = lengthdir_y(moveSpeed, point_direction(x, y, xTo, yTo));
		} else {
			hunger = 100;
			ds_list_delete(global.trees, ds_list_find_index(global.trees, foundTree));
			instance_destroy(foundTree);
			foundTree = false;
		}
	} else {
		var closest = [-1, 0];
		for (var i = 0; i < ds_list_size(global.trees); i++) {
			var tree = ds_list_find_value(global.trees, i);
		
			if (instance_exists(tree) && tree.h <= neckSize) {
				var xLen = abs(tree.x - x);
				var yLen = abs(tree.y - y);
				var len = sqrt(sqr(xLen) + sqr(yLen));
				if (closest[0] == -1 || len < closest[1]) {
					closest[0] = tree;
					closest[1] = len;
				}
			}
		}
		
		if (closest[0] != -1 && instance_exists(closest[0])) {
			xTo = closest[0].x;
			yTo = closest[0].y;
			foundTree = closest[0];
		}
		
		if (!foundTree) IdleBehavior();
	}
}

function SearchingMateBehavior() {
	
	if (!instance_exists(foundMate)) foundMate = false;
	
	if (foundMate) {
		xTo = foundMate.x;
		yTo = foundMate.y;
		
		if (!At(xTo, yTo)) {
			xSpeed = lengthdir_x(moveSpeed, point_direction(x, y, xTo, yTo));
			ySpeed = lengthdir_y(moveSpeed, point_direction(x, y, xTo, yTo));
		} else {
			sexDrive = 0;
			foundMate = false;
			
			if (gender == GENDER.FEMALE) {
				with (instance_create_layer(x, y, "Bodies", oGiraffe)) {
					neckSize = random_range(other.neckSize - 4, other.neckSize + 4);
					age = 0;
					ds_list_add(global.giraffes, id);
				}
			}
		}
	} else {
		for (var i = 0; i < ds_list_size(global.giraffes); i++) {
			var giraffe = ds_list_find_value(global.giraffes, i);

			if (instance_exists(giraffe) && giraffe != id && giraffe.state == STATE.SEARCHING_MATE && giraffe.gender == mateGender && !other.foundMate) {
				foundMate = giraffe;
				giraffe.foundMate = id;
				break;
			}
		}
		
		if (!foundMate) {
			IdleBehavior();
		}
	}
}

function DeadBehavior() {
	xSpeed = 0; 
	ySpeed = 0;
}