if(instance_number(objScreenTitle) > 0){ return; }


for(var i=0; i<hpMax; i++){
	var s = hp > i ? imgHPBarTile : imgMissingBarTile;
	draw_sprite_stretched(s, 0, i*8, 0, 8, 16);
	
}

for(var i=0; i<mpMax; i++){
	var s = mp > i ? imgMPBarTile: imgMissingBarTile;
	draw_sprite_stretched(s, 0, i*8, 17, 8, 16);
	
}