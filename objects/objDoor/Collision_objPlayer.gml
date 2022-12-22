if(pc.yIn == -1 && pc.doorCD < 1){
	pc.doorCD = 30;
	
	
	room_goto(goto);
	pc.x = xx;
	pc.y = yy;
}

