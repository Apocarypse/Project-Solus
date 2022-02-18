// check for inputs every step
global.pauseKey = keyboard_check_pressed(vk_escape);
global.keyLeft = keyboard_check(ord("A"));
global.keyRight = keyboard_check(ord("D"));
global.keyUp = keyboard_check(ord("W"));
global.keyDown = keyboard_check(ord("S"));
global.keyAttack = mouse_check_button_pressed(mb_right) or keyboard_check(vk_shift);