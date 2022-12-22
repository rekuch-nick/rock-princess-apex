function characterInBlockX(dir){
	var block = noone;
	
	if(x < 0 || x >= room_width){ return true; }
	
	
	block = pointInBlock(x + (xFat * dir), y - 1);
	
	
	if(block == noone){
		block = pointInBlock(x + (xFat * dir), y - (head - 1) );
	}
	
	/*
	if(block == noone){
		block = pointInBlock(x + (xFat * dir), y - floor(head / 2) );
	}*/
	
	
	
	
	return block;
}