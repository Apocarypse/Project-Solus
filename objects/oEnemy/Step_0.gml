if eHP <= 0
{	
	if not dead
	{
		dead = true;
		image_index = 0;
	}
	
	sprite_index = sSlimeDeath;
	
	if AnimationEnd()
		instance_destroy();
}

if not dead
{
	if collision_circle(x, y, 20, oPlayer, true, true)
	{
		if not attacking
			image_index = 0;
		
		attacking = true;
		sprite_index = sSlimeAttack;
	}

	else
		if AnimationEnd()
		{
			attacking = false;
			sprite_index = sSlime;
		}
	
	if collision_circle(x, y, 20, oAttack, true, true)
	{
		sprite_index = sSlimeHit;
		eHP--;
	}
}