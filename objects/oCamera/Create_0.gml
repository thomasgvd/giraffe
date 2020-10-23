zoom = 1;
defaultZoomW = camera_get_view_width(view_camera[0]);
defaultZoomH = camera_get_view_height(view_camera[0]);

startX = room_width / 2 - defaultZoomW / 2;
startY = room_height / 2 - defaultZoomH / 2;

camera_set_view_pos(view_camera[0], startX, startY);
window_set_fullscreen(true);

clickX = room_width / 2;
clickY = room_height / 2;