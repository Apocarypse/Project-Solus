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
	sprite_index = sSlimeHit;