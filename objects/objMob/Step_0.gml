if(instance_number(objScreen) > 0){ image_index = 0; return; }

if(hp < 1){
	instance_destroy();
}

xDisToPlater = abs(x - pc.x);
if(xDisToPlater > activeRange){ return; }

if(thinkCD > 0){
	thinkCD --;
} else {
	thinkCD = thinkCDMax;
	
	var xx = moveSpeed + irandom_range(-speedRange, speedRange);
	
	if(x < pc.x){ xSpeed = xx; }
	if(x > pc.x){ xSpeed = -xx; }
	
	if(closeTo){
		if(xDisToPlater < closeToRange){ xSpeed *= -1; }
		if(abs(xDisToPlater - closeToRange) < 20){ xSpeed = 0; }
	}
	
	if(irandom_range(0, 99) < jumpChance){ ySpeed = jumpPower; }
	
}


face = getDir(pc.x - x);
if(image_xscale < 0 && face > 0){ image_xscale *= -1; }
if(image_xscale > 0 && face < 0){ image_xscale *= -1; }


event_inherited();






if(shotType != noone){
	if(strikeCD > 0){
		strikeCD --;
	} else {
		strikeCD = irandom_range(strikeCDMax / strikeCDRollMod, strikeCDMax);
	
	
		var yo = y + yShotMod;
		//instance_create_depth(x, yo + 32, ww.layerE, shotType);
		instance_create_depth(x, yo, ww.layerE, shotType);
	
	
	}
}



if(hurtTime > 0){ hurtTime --; }


var f = baseFrame;
if(strikeCD < strikeCDLow){ f = readyFrame; }
sprite_index = f;

