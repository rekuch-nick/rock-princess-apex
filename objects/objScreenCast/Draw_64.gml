draw_self();

for(var i=0; i<array_length(pc.spells); i++){
	if(pc.spellLevel[i] < 1){ continue; }
	var sp = pc.spells[i];
	
	var c = playerCanCast(i) ? c_white : c_navy;
	
	draw_sprite_stretched_ext(sp, 0, 32 + (i * 80), y + 64 + 32, 64, 64, c, 1);
	
	if(pc.spell == i){
		draw_sprite_stretched_ext(iconSpellCursor, floor(counter/3) % 2, 32 + (i * 80), y + 64 + 32, 64, 64, c_white, 1);
	}
}