function getPlayerInput(){
	
	getGamepad();
	
	pc.xIn = 0;
	pc.yIn = 0;
	
	if(keyboard_check(vk_left) || keyboard_check(ord("A")) ||
								gamepad_button_check(pc.gamepadID, gp_padl) || 
								gamepad_axis_value(pc.gamepadID, gp_axislh) < -.5 ){
		xIn --;
		facing = -1;
	}
	
	if(keyboard_check(vk_right) || keyboard_check(ord("D")) ||
								gamepad_button_check(pc.gamepadID, gp_padr) || 
								gamepad_axis_value(pc.gamepadID, gp_axislh) > .5 ){
	
		xIn ++;
		facing = 1;
	}
	
	if(keyboard_check(vk_down) || keyboard_check(ord("S")) ||
								gamepad_button_check(pc.gamepadID, gp_padd) || 
								gamepad_axis_value(pc.gamepadID, gp_axislv) > .5 ){
		yIn ++;
	}
	
	if(keyboard_check(vk_up) || keyboard_check(ord("W")) ||
								gamepad_button_check(pc.gamepadID, gp_padu) || 
								gamepad_axis_value(pc.gamepadID, gp_axislv) < -.5 ){
		yIn --;
	}
	

	

	
	pc.pressedJump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(pc.gamepadID, gp_face1);
	if( keyboard_check(vk_space) || gamepad_button_check(pc.gamepadID, gp_face1) ){
		pc.holdingJumpTime = clamp(pc.holdingJumpTime + 1, 0, 900);
	} else {
		pc.holdingJumpTime = 0;
	}
	
	pc.pressedStrike = keyboard_check_pressed(ord("1")) || gamepad_button_check_pressed(pc.gamepadID, gp_face2);
	if( keyboard_check(ord("1")) || gamepad_button_check(pc.gamepadID, gp_face2) ){
		pc.holdingStrikeTme = clamp(pc.holdingStrikeTme + 1, 0, 900);
	} else {
		pc.holdingStrikeTme = 0;
	}
	
	pc.pressedDodge = keyboard_check_pressed(ord("2")) || gamepad_button_check_pressed(pc.gamepadID, gp_face3);
	if( keyboard_check(ord("2")) || gamepad_button_check(pc.gamepadID, gp_face3) ){
		pc.holdingDodgeTime = clamp(pc.holdingStrikeTme + 1, 0, 900);
	} else {
		pc.holdingDodgeTime = 0;
	}
	
	pc.pressedCast = keyboard_check_pressed(ord("3")) || gamepad_button_check_pressed(pc.gamepadID, gp_face4);
	if( keyboard_check(ord("3")) || gamepad_button_check(pc.gamepadID, gp_face4) ){
		pc.holdingCastTime = clamp(pc.holdingCastTime + 1, 0, 900);
	} else {
		pc.holdingCastTime = 0;
	}
	
	
	pc.pressedOk = pc.pressedJump || gamepad_button_check_pressed(pc.gamepadID, gp_start) || keyboard_check_pressed(vk_enter);
	
	pc.pressedNo = pc.pressedStrike || gamepad_button_check_pressed(pc.gamepadID, gp_select) || keyboard_check_pressed(vk_escape);
	
	
	

}