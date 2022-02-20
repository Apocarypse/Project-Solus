function EnemyState_Wander()
{
	sprite_index = moveSprite;
	
	// have we reached our destination?
	if x == xTo and y == yTo or timePassed > wanderDistance / moveSpeed
	{
		// stop movement
		horizontalSpeed = 0;
		verticalSpeed = 0;
		
		// end movement animation
		if image_index < 1
		{
			image_speed = 0;
			image_index = 0;
		}
		
		// set new destination
		if ++wait >= waitDuration
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(wanderDistance, dir);
			yTo = y + lengthdir_y(wanderDistance, dir);
		}
	}
	
	// move towards destination
	else
	{
		timePassed++;
		image_speed = 1;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = moveSpeed;
		
		if _distanceToGo < moveSpeed
			_speedThisFrame = _distanceToGo;
			
		dir = point_direction(x, y, xTo, yTo);
		horizontalSpeed = lengthdir_x(_speedThisFrame, dir);
		verticalSpeed = lengthdir_y(_speedThisFrame, dir);
			
		Collision();
	}
	
	// check for aggro
	if ++aggroCheck >= aggroCheckDuration
	{
		aggroCheck = 0;
		if instance_exists(oPlayer) and point_distance(x, y, oPlayer.x, oPlayer.y) <= aggroRadius
		{
			state = EnemyState_Chase;
		}
	}
}

function EnemyState_Chase()
{
	sprite_index = moveSprite;
	var playerExists = instance_exists(oPlayer);
	
	if playerExists
	{
		xTo = oPlayer.x;
		yTo = oPlayer.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);

		if _distanceToGo > moveSpeed
		{
			horizontalSpeed = lengthdir_x(moveSpeed, dir);
			verticalSpeed = lengthdir_y(moveSpeed, dir);
		}
		
		else
		{
			horizontalSpeed = lengthdir_x(_distanceToGo, dir);
			verticalSpeed = lengthdir_y(_distanceToGo, dir);
		}
			
		Collision();
	}
	
	// in attack range
	if playerExists and point_distance(x, y, oPlayer.x, oPlayer.y) <= attackRadius
	{
		state = EnemyState_Attack;
		sprite_index = attackSprite;
		image_index = 0;
		image_speed = 1;
	}
}

function EnemyState_Attack()
{
	if AnimationEnd()
	{
		stateTarget = EnemyState_Chase;
		stateWaitDuration = 5;
		state = EnemyState_Wait;
	}
}

function EnemyState_Hit()
{
	sprite_index = hitSprite;
	
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
		
		if statePrevious != EnemyState_Attack
			state = EnemyState_Chase;
		
		else
			state = EnemyState_Chase;
	}
	
}

function EnemyState_Dead()
{
	sprite_index = deathSprite;
	image_speed = 1;
	
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	if _distanceToGo > moveSpeed
	{
		dir = point_direction(x, y, xTo, yTo);
		horizontalSpeed = lengthdir_x(moveSpeed, dir);
		verticalSpeed = lengthdir_y(moveSpeed, dir);
		
		if horizontalSpeed != 0
			image_xscale = sign(horizontalSpeed);
			
		Collision();
	}
	
	else
	{
		x = xTo;
		y = yTo;
	}
	
	if AnimationEnd()
		instance_destroy();
}

function EnemyState_Wait()
{
	if ++stateWait >= stateWaitDuration
	{
		stateWait = 0;
		state = stateTarget;
	}
}

function HitEnemy(enemy, damage, source, knockback)
{
	with enemy
	{
		MakeParticle(sSlimeParticles, true, x, y, image_xscale);
		
		if state != EnemyState_Dead
			hp -= damage;
		
		if hp <= 0
			state = EnemyState_Dead;
			
		else
		{
			if state != EnemyState_Hit
				statePrevious = state;
				
			state = EnemyState_Hit;
		}
		
		image_index = 0;
		
		if knockback != 0
		{
			var _knockDirection = point_direction(x, y, source.x, source.y);
			xTo = x - lengthdir_x(knockback, _knockDirection);
			yTo = y - lengthdir_y(knockback, _knockDirection);
		}
	}
}