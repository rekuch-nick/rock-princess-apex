if(instance_number(objScreen) > 0){ return; }

x += xSpeed;
y += ySpeed;
ySpeed += grav;

image_angle += rot;
image_alpha -= fade;

timeCD --;
if(image_alpha < 0 || timeCD < 1){
	instance_destroy();
}

