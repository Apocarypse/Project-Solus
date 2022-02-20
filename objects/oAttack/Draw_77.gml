MakeParticle(sMusic, true, x, y, image_xscale);

if place_meeting(x, y, oCol) or place_meeting(x, y, oEnemy)
{
	MakeParticle(sMusic, false, x, y, image_xscale);
	Screenshake(0.5, 3);
	instance_destroy();
}
