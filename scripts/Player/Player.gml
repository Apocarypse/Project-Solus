function PlayerState_Free()
{
	#region Movement
	
	if horizontalInput != 0 or verticalInput != 0
	{
		dir = point_direction(0, 0, horizontalInput, verticalInput);
		
		Collision();
	}
	
	#endregion
	
	#region Animation
	
	// make player face the mouse
	var mousePos = point_direction(x, y, mouse_x, mouse_y);
	var facing = round(mousePos / 90);
		
	switch facing
	{
		case 0: sprite_index = sPlayerRight; break;
		case 1: sprite_index = sPlayerBack; break;
		case 2: sprite_index = sPlayerLeft; break;
		case 3: sprite_index = sPlayerFront; break;
		case 4: sprite_index = sPlayerRight; break;
	}

	// freeze sprite if not moving
	if horizontalInput == 0 and verticalInput == 0
	{
		image_index = 0;
		image_speed = 0;
	}

	else
		image_speed = 1;
		
	#endregion
	
	#region States
	
	// initiate attack state
	if global.keyAttack
	{
		state = PlayerState_Attack;
		image_index = 0;
	}
	
	#endregion
}

function PlayerState_Attack()
{
	// make sure animation isn't paused
	image_speed = 1;
	
	// clear hit list
	with oAttack
	{
		if not ds_exists(hitByAttack, ds_type_list)
			hitByAttack = ds_list_create();
	
		ds_list_clear(hitByAttack);
	}
	
	// building facing data based off mouse position
	var mousePos = point_direction(x, y, mouse_x, mouse_y);
	var facing = round(mousePos / 90);
	var attackFacingX;
	var attackFacingY;
	
	switch facing
	{
		case 0: sprite_index = sPlayerAttackRight; attackFacingX = 1; attackFacingY = -1; break;
		case 1: sprite_index = sPlayerAttackFront; attackFacingX = 0; attackFacingY = -2.7; break;
		case 2: sprite_index = sPlayerAttackLeft; attackFacingX = -1; attackFacingY = -1; break;
		case 3: sprite_index = sPlayerAttackBack; attackFacingX = 0; attackFacingY = 0.7; break;
		case 4: sprite_index = sPlayerAttackRight; attackFacingX = 1; attackFacingY = -1; break;
	}
	
	// make the attack
	if not attacking
	{
		attacking = true;
		
		MakeAttack(mousePos, attackFacingX, attackFacingY, currentAttack);
	}
	
	// switch back to free state after animation is over
	if AnimationEnd()
	{
		state = PlayerState_Free;
		attacking = false;
	}
}

function PlayerState_Hit()
{	
	//sprite_index = hitSprite;
	
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	if _distanceToGo > moveSpeed
	{
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		horizontalSpeed = lengthdir_x(moveSpeed, dir);
		verticalSpeed = lengthdir_y(moveSpeed, dir);
		
		if horizontalSpeed != 0
			image_xscale = sign(horizontalSpeed);
			
		if Collision()
		{
			xTo = x;
			yTo = y;
		}
	}
	
	else
	{
		x = xTo;
		y = yTo;
		
		state = PlayerState_Free;
	}
	
}

function PlayerState_Dead()
{
	game_restart();
}

function HitPlayer(dirHitFrom, force, damage)
{
	if oPlayer.invulnerable <= 0
	{
		oPlayer.hp = max(0, oPlayer.hp - damage)
		
		if oPlayer.hp > 0
		{
			with oPlayer
			{
				invulnerable = 60;
				state = PlayerState_Hit;
				image_index = 0;
				xTo = x - lengthdir_x(force, dirHitFrom);
				yTo = y - lengthdir_y(force, dirHitFrom);
				Screenshake(1.5, 2);
			}
		}
		
		else
			state = PlayerState_Dead;
	}
}