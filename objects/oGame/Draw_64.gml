draw_set_halign(fa_left);
draw_text(64, 48, "speed: " + string(global.spd));
draw_text(64, 64, "nb trees: " + string(ds_list_size(global.trees)));
draw_text(64, 80, "nb giraffes: " + string(ds_list_size(global.giraffes)));
draw_text(64, 96, "died of old age: " + string(global.diedOfOldAge));
draw_text(64, 112, "died of hunger: " + string(global.diedOfHunger));
draw_text(64, 128, "avg neck size: " + string(avgNeckSize));