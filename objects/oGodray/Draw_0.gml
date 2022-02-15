if instance_exists(self)
{

	var wobbleAmountX = image_xscale + random_range(-wobble, wobble);
	var wobbleAmountY = image_yscale + random_range(-wobble, wobble);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x, y, 0, 0, 0, c_white, 1);
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, 0, 0, 0, color, intensity);

	for (c = 0; c < 360; c += 10)
	{
	draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(6, c), y + lengthdir_y(6, c), wobbleAmountX, wobbleAmountY, image_angle, color, sineWave * 0.01);
	}

	gpu_set_blendmode(bm_normal);

	draw_self();
}