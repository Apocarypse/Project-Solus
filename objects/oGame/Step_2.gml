if global.pauseKey
{
	// toggle pausing
	global.gamePaused = not global.gamePaused;
	
	if global.gamePaused
	{
		with all
		{
			image_speed = 0;
		}
	}
	
	else
	{
		with all
		{
			image_speed = 1;
		}
	}
}