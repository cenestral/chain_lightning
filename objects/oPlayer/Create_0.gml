range = 200
cooldown = 0
electrified = 0;

damage_single_enemy = function(target){
	target.hp-=1;	
}

damage_all_targets = function(list_of_enemies,damage){
	var number_of_targets = array_length(list_of_enemies);
	for(var i=0;i<number_of_targets;i++){
		list_of_enemies[i].hp-=damage
	}
}
