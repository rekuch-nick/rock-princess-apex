if(instance_number(objScreen) > 0){ return; }


x += xSpeed;
y += ySpeed;

ySpeed += grav;


image_angle += rot;

dis -= abs(xSpeed);



if(pointInBlock(x, y) || dis < 1){
	instance_destroy();
}