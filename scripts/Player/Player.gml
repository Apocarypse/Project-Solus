function PlayerState_Free()
{
	
	if horizontalInput != 0 or verticalInput != 0
	{
		dir = point_direction(0, 0, horizontalInput, verticalInput);
		
		var moveX = lengthdir_x(moveSpeed, dir);
		var moveY = lengthdir_y(moveSpeed, dir);
	
		if place_meeting(x + moveX, y, oCol)
			moveX = 0;
		
		if place_meeting(x, y + moveY, oCol)
			moveY = 0;
	
		x += moveX;
		y += moveY;
	
		switch dir
		{
			case 0: sprite_index = sPlayerRight; break;
			case 90: sprite_index = sPlayerBack; break;
			case 180: sprite_index = sPlayerLeft; break;
			case 270: sprite_index = sPlayerFront; break;
		}
	}

	if horizontalInput == 0 and verticalInput == 0
	{
		image_index = 0;
		image_speed = 0;
	}

	else
		image_speed = 1;
		
	if keyAttack
	{
		state = PlayerState_Attack;
		image_index = 0;
	}
}

function PlayerState_Attack()
{
	image_speed = 1;
	
	switch dir
	{
		case 0: sprite_index = sPlayerAttackRight; break;
		case 90: sprite_index = sPlayerAttackFront; break;
		case 180: sprite_index = sPlayerAttackLeft; break;
		case 270: sprite_index = sPlayerAttackBack; break;
	}
	
	if not attacking
	{
		attacking = true;
		
		with instance_create_layer(floor(x), floor(y) - 30, "Skills", oSharp)
		{
			direction = other.dir;
		}
	}
	
	if AnimationEnd()
	{
		state = PlayerState_Free;
		attacking = false;
	}
}