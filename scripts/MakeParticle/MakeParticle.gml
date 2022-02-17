function MakeParticle(sprite, useAngle, pX, pY, xScale)
{
	var thisParticle = instance_create_layer(pX, pY, "Particles", oParticle);
	with thisParticle
	{
		if useAngle
			image_angle = irandom(720);
			
		sprite_index = sprite;
		image_xscale = xScale;
	}
}