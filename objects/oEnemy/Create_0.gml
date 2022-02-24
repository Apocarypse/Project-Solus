// intrinsic vars
state = EnemyState_Wander;
stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWaitDuration = 0;

moveSpeed = 0.5;
horizontalSpeed = 0;
verticalSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;

wanderDistance = 32;
timePassed = 0;
waitDuration = irandom_range(room_speed * 1, room_speed * 3);
wait = 0;

aggroCheck = 0;
aggroCheckDuration = 5;
aggroRadius = 48;
attackRadius = 15;
forceTouch = 32;
// stats
hp = 1;
damage = 5;

// sprites
moveSprite = sSlime;
attackSprite = sSlimeAttack;
hitSprite = sSlimeHit;
deathSprite = sSlimeDeath;

// randomize image index on spawn to prevent mirroring
image_index = random(image_number);