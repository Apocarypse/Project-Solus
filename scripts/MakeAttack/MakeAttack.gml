function MakeAttack(mousePos, attackFacingX, attackFacingY, attackObject)
{
	with instance_create_layer(floor(x + (15 * attackFacingX)), floor(y) + (10 * attackFacingY), "Skills", attackObject)
	{
		direction = mousePos;
	}
}