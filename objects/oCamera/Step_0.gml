if keyboard_check(vk_pageup)
	newZoom = min(newZoom + 0.1, 8);
	
if keyboard_check(vk_pagedown)
	newZoom = max(newZoom - 0.1, 3);