function PlayerState_Free()
{
	#region Movement
	
	if horizontalInput != 0 or verticalInput != 0
	{
		dir = point_direction(0, 0, horizontalInput, verticalInput);
		
		var moveX = lengthdir_x(moveSpeed, dir);
		var moveY = lengthdir_y(moveSpeed, dir);
	
		// collision
		if place_meeting(x + moveX, y, oCol)
			moveX = 0;
		
		if place_meeting(x, y + moveY, oCol)
			moveY = 0;
	
		x += moveX;
		y += moveY;
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