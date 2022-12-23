if(instance_number(objScreen) > 0){ return; }


var xx = xSpeed;

if(xPush != 0){
	xx = xPush;
	xPush -= getDir(xPush);
}

if(xx != 0){
	
	x += xx;
	var dir = getDir(xx);
	var tries = 0;
	while(characterInBlockX(dir) != noone && tries < 100){
		tries ++;
		x -= dir;
		
		
	}
	
}




if(characterOnGround() != noone || onLadder){
	if(ySpeed > 0 && !onLadder){ ySpeed = 0; }
	jumps = jumpsMax;
	airDodges = 1;
	
} else {
	
	
	if(jumps == jumpsMax){ jumps --; }
	ySpeed += grav;
	
	
	if(dodgeTime > 0){ ySpeed ++; }
}



var yy = ySpeed;

if(yPush != 0){
	yy = yPush;
	yPush -= getDir(yPush);
}


for(var i=0; i<yy; i++){
	if(characterOnGround() == noone){
		y ++;
	} else {
		break;
	}
}

for(var i=0; i>yy; i--){
	y --;
	if(characterHeadInBlock() != noone){
		y ++;
		break;
	}
}







var closestProjectile = noone;
var bestDis = 10000;
var b = y - (head / 2);

with(objPlayerSword){
	if(other.aly != aly){
		var dis = point_distance(x, y, other.x, b);
		if(dis < bestDis){
			closestProjectile = id;
			bestDis = dis;
		}
	}
}

if(closestProjectile != noone){
	if(place_meeting(x, y, closestProjectile)){
		characterAttacked(id, closestProjectile);
	}
}










