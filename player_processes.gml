
function reset_variables(){
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	dash -= 1;
		
}

function get_input() {
	if keyboard_check(ord("A")) left = 1;
	if keyboard_check(ord("D")) right = 1;
	if keyboard_check(ord("W")) up = 1;
	if keyboard_check(ord("S")) down = 1;
	if keyboard_check(ord(" ")) and dash <= 0 and left + right + up + down >= 1 {dash = 100;}
}

function calc_movement() {
	var _hmove = right - left;
	var _vmove = down - up;
	
	if dash >= 90 {
		walk_spd += 3
	} else {
		walk_spd = 6
	}
	
	if _hmove != 0 or _vmove != 0 {
		// direction we movin
		var _dir = point_direction(0, 0, _hmove, _vmove);
		
		// get the distance we are movin
		_hmove = lengthdir_x(walk_spd, _dir);
		_vmove = lengthdir_y(walk_spd, _dir);
		
		//add movement
		x += _hmove;
		y += _vmove;
	}
	
}

function collision() {
	//set target values
	var _tx = x;
	var _ty = y;
	
	// move back before collision
	x = xprevious;
	y = yprevious;
	
	// get the distance
	var _disx = abs(_tx - x);
	var _disy = abs(_ty - y);
	
	//move as far as we can until hitting the solid
	
	repeat(_disx) {
		if !place_meeting(x + sign(_tx - x), y, o_collisionwall)	x += sign(_tx - x);
	}
	repeat(_disy) {
		if !place_meeting(x, y + sign(_ty - y), o_collisionwall)	y += sign(_ty - y);
	}
}