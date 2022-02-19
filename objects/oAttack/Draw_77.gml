MakeParticle(sMusic, true, x, y, image_xscale);

if place_meeting(x, y, oCol) or place_meeting(x, y, oEnemy)
{
	MakeParticle(sMusic, false, x, y, image_xscale);
	instance_destroy();
	
	var thisEnemy = instance_place(x, y, oEnemy);
	
	with thisEnemy
		EnemyHit();
}
