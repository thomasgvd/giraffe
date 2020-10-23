#macro mBorder 75
#macro randomX irandom_range(mBorder, room_width - mBorder)
#macro randomY irandom_range(mBorder, room_height - mBorder)

enum STATE {
	IDLE, EATING, BREEDING, FIGHTING, SEARCHING_FOOD, DEAD, SEARCHING_MATE
}

enum GENDER { MALE, FEMALE }

global.spd = 1;
nbGiraffes = 10;
nbTrees = 10;
global.trees = ds_list_create();
global.giraffes = ds_list_create();
global.diedOfHunger = 0;
global.diedOfOldAge = 0;

TREE_CD = 45;
growTreeCd = TREE_CD;
avgNeckSize = 0;

for (var i = 0; i < nbGiraffes; i++) {
	with (instance_create_layer(randomX, randomY, "Bodies", oGiraffe)) {
		ds_list_add(global.giraffes, id);
		hunger = random_range(50, 100);
	}
}

for (var i = 0; i < nbTrees; i++) {
	with (instance_create_layer(randomX, randomY, "Trees", oTree)) {
		ds_list_add(global.trees, id);
	}
}