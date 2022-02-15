var darkness

switch room_get_name(room)
{
	//case "Forest": darkness = oPlayer.y * 0.001; break;
	//case "Below": darkness = 0.3; break;
	//case "Dungeon": darkness = 0.6; break;
	//case "Cells": darkness = 0.7; break;
	//case "Oubliette": darkness = 0.3; break;
	//case "Library": darkness = 0.5; break;
	case "Room1": darkness = 0.15; break;
}

if not surface_exists(lightingSurface)
	lightingSurface = surface_create(room_width, room_height);

surface_set_target(lightingSurface);

draw_clear_alpha(c_black, darkness);

with oLighting
{
	var wobbleAmountX = image_xscale + random_range(-wobble, wobble);
	var wobbleAmountY = image_yscale + random_range(-wobble, wobble);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x, y, wobbleAmountX, wobbleAmountY, 0, c_white, intensity);
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, wobbleAmountX, wobbleAmountY, 0, color, intensity);
    gpu_set_blendmode(bm_normal);
}

surface_reset_target();

draw_surface(lightingSurface, 0, 0);