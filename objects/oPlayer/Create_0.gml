range = 200
cooldown = 0
electrified = 0;
hp=0
damage_single_enemy = function(target){
	target.hp-=1;	
}




damage_all_targets = function(list_of_enemies,damage){
	var effect = instance_create_layer(x,y,"Instances",oLightning)
		
	for(var i=0;i<array_length(list_of_enemies);i++){
		var target = list_of_enemies[i];
		//damage enemy
		target.hp-=damage
		target.electrified=1
		
		//add enemy position for the effect
		array_push(effect.points,[target.x,target.y])
	}
}
