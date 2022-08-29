if cooldown>60{
	cooldown=0
	var enemies_hit = lightning_strike_simple(x,y,oEnemy,range,4,true)
	damage_all_targets(enemies_hit,1)
}