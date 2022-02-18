function MakeAttack(mousePos, attackFacingX, attackFacingY, attackSprite)
{
	with instance_create_layer(floor(x + (15 * attackFacingX)), floor(y) + (10 * attackFacingY), "Skills", attackSprite)
	{
		direction = mousePos;
	}
}