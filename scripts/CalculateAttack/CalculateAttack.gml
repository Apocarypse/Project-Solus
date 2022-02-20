function CalculateAttack()
{
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, oEnemy, hitByAttackNow, false);
	
	if hits > 0
	{
		for (var i = 0; i < hits; i++)
		{
			var hitID = hitByAttackNow[| i];
			
			if ds_list_find_index(hitByAttack, hitID) == -1
			{
				ds_list_add(hitByAttack, hitID);
				
				with hitID
				{
					if object_is_ancestor(object_index, oEnemy)
					{
						HitEnemy(id, 1, other.id, 20);
					}
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
}