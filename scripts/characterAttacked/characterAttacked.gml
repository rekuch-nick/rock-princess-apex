function characterAttacked(c, o){
	
	
	var hitHappens = true;
	
	if(c.hurtTime > 0){ hitHappens = false; }
	
	if(c.dodgeTime > 0){
		hitHappens = false;
		
		if(c.object_index == objPlayer && o.pushStone){
			if(o.bumpPow > 0){ c.xPush = floor(o.bumpPow / 2) * getDir(c.x - o.x); }
		}
		
		if(o.deflectEffect != noone){ instance_create_depth(o.x, o.y, ww.layerE, o.deflectEffect); }
		if(o.removeOnCollision){ instance_destroy(o); } //
	}
	
	if(hitHappens){
		c.hurtTime = c.hurtTimeMax;
		
		if(o.bumpPow > 0){
			c.yPush = -6;
			c.xPush = o.bumpPow * getDir(c.x - o.x);
			
		}
		
		c.hp -= o.pow;
		
		if(o.removeOnCollision){ instance_destroy(o); }
	}
	
	
	
	
	
}