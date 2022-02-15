// zoom
zoom = 5;
newZoom = zoom;
viewWidth = 1920 / zoom;
viewHeight = 1080 / zoom;

// window size
windowScale = 5;

window_set_size(viewWidth * windowScale, viewHeight * windowScale);
alarm[0] = 1;

surface_resize(application_surface, viewWidth * windowScale, viewHeight * windowScale);

shakeRemain = 0;
shakeLength = 0;
shakeMagnitude = 0;