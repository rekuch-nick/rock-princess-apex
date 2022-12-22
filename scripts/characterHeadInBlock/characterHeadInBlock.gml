function characterHeadInBlock(){
	if(y < 10){ return true; }
	
	var block = pointInBlock(x, y - head);
	if(block == noone){ block = pointInBlock(x - xFat, y - head); }
	if(block == noone){ block = pointInBlock(x + xFat, y - head); }
	
	return block;
}