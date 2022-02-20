draw_sprite(sHealthBarContainer, 1, 8, 9);
draw_sprite_ext(sHealthBarFill, 1, 8, 9, max(0, oPlayer.hp / oPlayer.maxHP) * healthbarWidth, 1, 0, c_white, 1);