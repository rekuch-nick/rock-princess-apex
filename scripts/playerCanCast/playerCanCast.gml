function playerCanCast(i){
	
	if(array_length(pc.spells) <= i){ return false; }
	
	if(pc.spellLevel[i] < 1){ return false; }
	
	if(pc.mp < pc.spellCost[i]){ return false; }
	
	return true;
	
}