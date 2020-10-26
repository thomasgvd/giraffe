if (following != -1 && instance_exists(following)) {
	image_xscale = following.image_xscale;
	//image_yscale = following.image_yscale;
	x = following.x + (xPos * image_xscale);
	y = following.y - 40 - yPos;
} else {
	instance_destroy();
}