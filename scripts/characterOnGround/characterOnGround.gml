function characterOnGround(){
	
	if(y >= room_height){ return true; }
	//if(onLadder){ return true; }
	
	var block = noone;
	block = pointInBlock(x, y + 1);
	if(block == noone){
		block = pointInBlock(x + (xFat * -1), y + 1 );
	}
	if(block == noone){
		block = pointInBlock(x + (xFat * -1), y + 1 );
	}
	if(block != noone){ return block; }
	
	if(dropTime <= 0){
		if(pointInPlatform(x, y + 1)){ return true; }
		if(pointInPlatform(x + xFat, y + 1)){ return true; }
		if(pointInPlatform(x + xFat * -1, y + 1)){ return true; }
	}
	
	return noone;
}