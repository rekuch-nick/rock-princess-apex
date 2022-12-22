getPlayerInput();


if(instance_number(objScreen) > 0){ return; }

if(dodgeTime < 1){
	if(strikeCD > 0){ 
		if(ySpeed == 0){
			xSpeed = 0; 
		}
	} else {
		xSpeed = moveSpeed * xIn;
	}
}

if(xIn < 0 && image_xscale > 0){ image_xscale *= -1; }
if(xIn > 0 && image_xscale < 0){ image_xscale *= -1; }


if(pressedJump && jumps > 0 && canJump){
	jumps --;
	canJump = false;
	
	ySpeed = jumpPower;
	onLadder = false;
}

//if(dodgeTime < 1 && pressedDodge && (ySpeed == 0 || airDodges > 0)){
//if(dodgeTime < 1 && ySpeed == 0 && pressedDodge){
if(dodgeTime < 1 && pressedDodge){
	if(ySpeed != 0){ airDodges --; }
	dodgeTime = 30;
	//ySpeed = -6; xSpeed = getDir(image_xscale) * -12;
	ySpeed = 0; xSpeed = 0;
	onLadder = false;
}

if(holdingJumpTime == 0 && dodgeTime < 1){
	canJump = true;
	if(ySpeed < 0){ ySpeed = 0; }
}

//strike
if(strikeCD < 1 && dodgeTime < 1){
	if(holdingStrikeTme > 0){
		strikeCD = 10;
		var xo = x + (getDir(image_xscale) * 48);
		var yo = y - 128;
		if(yIn > 0){ yo = yo + 64; }
		
		//effect_create_above(ef_spark, xo + getDir(image_xscale) * 28, yo + 32, 2, c_white);
		instance_create_depth(xo, yo + 32, ww.layerE, objPlayerSword);
		
				
	}
}

if(yIn > 0){ dropTime = 8; }


//check for ladder
if(collision_rectangle(x-xFat, y-head, x+xFat, y, objLadder, true, true) || 
					collision_rectangle(x-xFat, y-head, x+xFat, y, objLadderTop, true, true) ){
	if(yIn != 0){ 
		onLadder = true; 
	}
} else {
	onLadder = false;
}

//climb ladder
if(onLadder){
	if(yIn < 0){
		ySpeed = -3;
	} else if (yIn > 0) {
		ySpeed = 3;
	} else {
		ySpeed = 0;
	}
}


event_inherited();






var closestFoe = noone;
var bestDis = 10000;
var b = y - (head / 2);

with(objMob){
	if(other.aly != aly){
		var dis = point_distance(x, y, other.x, b);
		if(dis < bestDis){
			closestFoe = id;
			bestDis = dis;
		}
	}
}

if(closestFoe != noone){
	if(place_meeting(x, y, closestFoe)){
		if(dodgeTime > 0 && y + 5 < closestFoe.y) {
			characterAttacked(closestFoe, id);
		} else {
			characterAttacked(id, closestFoe);
		}
	}
}











if(holdingDodgeTime == 0){ dodgeTime = 0; }
if(dodgeTime > 0){ dodgeTime --; }
if(strikeCD > 0){ strikeCD --; }
if(hurtTime > 0){ hurtTime --; }
if(dropTime > 0){ dropTime --; }


var f = imgPlayer;
image_alpha = 1;
if(yIn > 0){ f = imgPlayerDuck; }
if(yIn < 0){ f = imgPlayerLookUp; }
if(xSpeed != 0){ f = imgPlayerRun; }
if(ySpeed < 0){ f = imgPlayerJump; }
if(ySpeed > 0){ f = imgPlayerFall; }

if(strikeCD > 0){ f = imgPlayerStrike; }
if(strikeCD > 0 && yIn > 0){ f = imgPlayerDuckStrike; }
if(onLadder){ f = imgPlayerClimb; if(ySpeed == 0){image_index = 0; } }

if(dodgeTime > 0){ f = imgPlayerDodge; } //image_alpha = .8; }
if(hurtTime > 0){ f = imgPlayerHurt; image_alpha = random_range(.2, 1); }
sprite_index = f;

