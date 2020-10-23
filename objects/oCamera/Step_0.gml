zoom = clamp(zoom + (((mouse_wheel_down() - mouse_wheel_up())) * 0.1), 0.1, 5);

var viewW = camera_get_view_width(view_camera[0]);
var viewH = camera_get_view_height(view_camera[0]);

var rate = 0.2;

var newW = lerp(viewW, zoom * defaultZoomW, rate);
var newH = lerp(viewH, zoom * defaultZoomH, rate);

camera_set_view_size(view_camera[0], newW, newH);

var shiftX = camera_get_view_x(view_camera[0]) - (newW - viewW) * 0.5;
var shiftY = camera_get_view_y(view_camera[0]) - (newH - viewH) * 0.5;

camera_set_view_pos(view_camera[0], shiftX, shiftY);

if (mouse_check_button_pressed(mb_left)) {
	clickX = mouse_x;
	clickY = mouse_y;
}

var newX = lerp(camera_get_view_x(view_camera[0]), clickX - viewW / 2, rate);
var newY = lerp(camera_get_view_y(view_camera[0]), clickY - viewH / 2, rate);

camera_set_view_pos(view_camera[0], newX, newY);