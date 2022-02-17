function Screenshake(magnitude, frames)
{
	global.screenShake = 5;
	
    with oCamera
	{
	    if magnitude > shakeRemain
		{
			shakeMagnitude = magnitude * global.screenShake;
			shakeRemain = magnitude * global.screenShake;
			shakeLength = frames * global.screenShake;
		}
	}
}