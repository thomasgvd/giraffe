gpu_set_fog(true, c_black, 0, 1);
var alpha = 0.3;
with (oGiraffe) {
	draw_sprite_ext(sprite_index, image_index, x, bbox_bottom, image_xscale, -0.4, 0, c_white, alpha);
	//draw_sprite_ext(sGiraffeNeck, image_index, x + 24 * image_xscale, y + sprite_height * 0.3, image_xscale, -0.4 * (neckSize / 5), 0, c_white, alpha);
	//draw_sprite_ext(sGiraffeHead, image_index, x + 55 * image_xscale, y + sprite_height * 0.25 + 0.4 * sprite_get_height(sGiraffeNeck) * (neckSize / 5), image_xscale, -0.6, 0, c_white, alpha);
}
with (oTree) {
	draw_sprite_ext(sTreeLeaves, image_index, x, y, image_xscale, -0.4, 0, c_white, alpha);
}
gpu_set_fog(false,c_white,0,0);