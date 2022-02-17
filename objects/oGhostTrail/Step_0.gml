sprite_index = host.sprite_index;
x = host.xprevious;
y = host.yprevious;
image_speed = host.image_speed;
image_index = host.image_index;
image_angle = host.image_angle;

image_alpha -= 0.5;

if image_alpha <= 0 or place_meeting(x, y, oCol)
	instance_destroy();
	
if image_index >= image_number - 1
	image_speed = 0;