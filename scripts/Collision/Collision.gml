function Collision()
{
	var _collision = false;
	
	var horizontalSpeed = lengthdir_x(moveSpeed, dir);
	var verticalSpeed = lengthdir_y(moveSpeed, dir);
	
	if place_meeting(x + horizontalSpeed, y, oCol)
	{
		horizontalSpeed = 0;
		_collision = true;
	}
	
	x += horizontalSpeed;
		
	if place_meeting(x, y + verticalSpeed, oCol)
	{
		verticalSpeed = 0;
		_collision = true;
	}
	
	y += verticalSpeed;
	
	return _collision;
}