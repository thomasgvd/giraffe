growTreeCd -= global.spd;

if (growTreeCd <= 0) {
	growTreeCd = TREE_CD;
	with (instance_create_layer(randomX, randomY, "Trees", oTree)) {
		ds_list_add(global.trees, id);
		age = 0;
	}
}

var sumNeckSize = 0;

for (var i = 0; i < ds_list_size(global.giraffes); i++) {
	var giraffe = ds_list_find_value(global.giraffes, i);
	
	sumNeckSize += giraffe.neckSize;
}

avgNeckSize = sumNeckSize / ds_list_size(global.giraffes);