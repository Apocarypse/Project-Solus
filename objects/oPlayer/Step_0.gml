horizontalInput = global.keyRight - global.keyLeft;
verticalInput = global.keyDown - global.keyUp;

if not global.gamePaused
{
	state();
	
	invulnerable = max(invulnerable - 1, 0);
}

depth = -bbox_bottom;