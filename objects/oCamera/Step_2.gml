#macro view view_camera[0]

zoom = lerp(zoom, newZoom, 0.01);

viewWidth = 1920 / zoom;
viewHeight = 1080 / zoom;

camera_set_view_size(view, viewWidth, viewHeight);

if instance_exists(oPlayer)
{
	var _x = clamp(oPlayer.x - viewWidth / 2, 0, room_width - viewWidth);
	var _y = clamp(oPlayer.y - viewHeight / 2, 0, room_height - viewHeight);
	
	_x += random_range(-shakeRemain, shakeRemain);
	_y += random_range(-shakeRemain, shakeRemain);
	
	shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));
	
	camera_set_view_pos(view, _x, _y);
	
	var currentX = camera_get_view_x(view);
	var currentY = clamp(camera_get_view_y(view), 0, room_height - viewHeight);
	
	x = lerp(currentX, _x, 0.1);
	y = lerp(currentY, _y, 0.1);
	
	camera_set_view_pos(view, x, y);
}