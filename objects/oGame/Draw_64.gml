draw_set_halign(fa_left);
draw_set_font(oFont);
draw_text(64, 75, "Speed: ");
draw_text(64, 125, "Nb of Giraffes: ");
draw_text(64, 175, "Died of old age: ");
draw_text(64, 225, "Died of hunger: ");
draw_text(64, 275, "Avg Neck Size: ");

draw_set_halign(fa_right);
draw_text(400, 75, string(global.spd) + "x");
draw_text(400, 125, ds_list_size(global.giraffes));
draw_text(400, 175, global.diedOfOldAge);
draw_text(400, 225, global.diedOfHunger);
draw_text(400, 275, avgNeckSize);