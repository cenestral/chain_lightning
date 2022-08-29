x+=((keyboard_check(ord("D"))?1:0)-(keyboard_check(ord("A"))?1:0))*3
y+=((keyboard_check(ord("S"))?1:0)-(keyboard_check(ord("W"))?1:0))*3

cooldown++
if mouse_check_button_pressed(mb_left){
	if cooldown>10{
		cooldown = 0;
		lightning_strike(x,y,oEnemy,range,4,true,damage_single_enemy)
	}
}

if mouse_check_button_pressed(mb_right){
	if cooldown>10{
		cooldown = 0;
		lightning_strike_simple(x,y,oEnemy,range,4,true,damage_single_enemy)
	}
}


