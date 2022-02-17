var thisSkill = instance_create_depth(x, y, depth, oGhostTrail)
thisSkill.host = self;

lifespan--;

if lifespan <= 0
	instance_destroy();