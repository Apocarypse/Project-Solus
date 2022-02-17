if image_index >= image_number - 1
{
	image_angle -= 10;
	MakeParticle(sMusic, true, x, y, image_xscale);
}

if place_meeting(x, y, oCol)
{
	MakeParticle(sSharpHit, false, x, y, image_xscale);
	instance_destroy();
}

if place_meeting(x, y, oEnemy)
{
	MakeParticle(sSharpHit, true, x, y, image_xscale);
	Screenshake(0.2, 6);
	speed -= 0.1;
}


	