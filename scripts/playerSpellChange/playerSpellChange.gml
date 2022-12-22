function playerSpellChange(n){
	var m = array_length(pc.spells);
	
	do{
		pc.spell += n;
		if(pc.spell < 0){ pc.spell = m - 1; }
		if(pc.spell >= m){ pc.spell = 0; }
	} until ( pc.spellLevel[pc.spell] > 0 );
	
}