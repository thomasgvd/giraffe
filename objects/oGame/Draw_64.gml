if (global.fontSize == 1) {
	var _font = oFont;
	var _x = 64;
	var _x2 = 400;
	var _y = 75;
	var _i = 50;
} else {
	var _font = oFont2;
	var _x = 150;
	var _x2 = 750;
	var _y = 100;
	var _i = 75;
}

draw_set_halign(fa_left);
draw_set_font(_font);
draw_text(_x, _y, "Speed: ");
draw_text(_x, _y + _i * 1, "Nb of Giraffes: ");
draw_text(_x, _y + _i * 2, "Died of old age: ");
draw_text(_x, _y + _i * 3, "Died of hunger: ");
draw_text(_x, _y + _i * 4, "Avg Neck Size: ");

draw_set_halign(fa_right);
draw_text(_x2, _y, string(global.spd) + "x");
draw_text(_x2, _y + _i * 1, ds_list_size(global.giraffes));
draw_text(_x2, _y + _i * 2, global.diedOfOldAge);
draw_text(_x2, _y + _i * 3, global.diedOfHunger);
draw_text(_x2, _y + _i * 4, avgNeckSize);

draw_sprite_ext(sGiraffeNeckGUI, 0, (_x2 + _x) / 2, _y + _i * 5 + (sprite_get_height(sGiraffeNeckGUI) / 2) * (avgNeckSize / 5), 2, avgNeckSize / 5, 0, c_white, 1);