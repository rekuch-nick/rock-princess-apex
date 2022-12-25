image_xscale = 4; image_yscale = 4;

aly = 1;
ySpeed = 0;
xSpeed = 12 * getDir(pc.image_xscale);

rot = getDir(xSpeed) * -6;
grav = 0;

dis = 64 * 8;

removeOnCollision = true;
pow = 4;
bumpPow = 10;
pushStone = false;

deflectEffect = noone;
isShieldable = true;