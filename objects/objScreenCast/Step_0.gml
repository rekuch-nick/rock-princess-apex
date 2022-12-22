

counter ++;
if(counter > 10){ counter = 1; }
if(icd > 0){ icd --; }

if(pc.xIn != 0 && icd < 1){
	playerSpellChange(pc.xIn);
	icd = 6;
}

if(pc.pressedOk && playerCanCast(pc.spell)){
	pc.pressedJump = false;
	pc.mp -= pc.spellCost[pc.spell];
	
	if(pc.spells[pc.spell] == iconSpellAxe){
		pc.axeTime = ((pc.spellLevel[pc.spell] * 4) + 8) * 30;
	}
	
	
	instance_destroy();
}

if(pc.pressedNo){
	pc.pressedStrike = false;
	
	instance_destroy();
}