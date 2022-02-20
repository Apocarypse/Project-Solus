if not global.gamePaused
{
	if state != EnemyState_Dead
	    if horizontalSpeed != 0
			image_xscale = -sign(horizontalSpeed);
	
	state();
	
	depth = -bbox_bottom;
}