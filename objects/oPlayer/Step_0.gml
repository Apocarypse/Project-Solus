horizontalInput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
verticalInput = keyboard_check(ord("S")) - keyboard_check(ord("W"));
keyAttack = mouse_check_button_pressed(mb_right) or keyboard_check(vk_shift);

if not global.gamePaused
	state();