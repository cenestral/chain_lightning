
//----------------------------
targeting    = pHuman; //what to target
precise      = true;   //precise collision check
target_owner = true;   //duh
range        = RANGE;  //macro in oPlayer 
max_jumps    = 4;      //max amount of lightning jumps
//----------------------------


//
list_of_targets = ds_list_create();
electrified = 0;
owner       = noone;

//just for fanciness
cooldown = 0
cooldown_max = 12;


get_targets = function(){
	var targets_found = 0;
	var temp_list  = ds_list_create();
	var jumps_left = max_jumps;
	
	ds_list_clear(list_of_targets)

	targets_found = collision_circle_list(x,y,range,targeting,precise,false,temp_list,true)	
		
	for(var i=0;i<targets_found;i++){
		var target = temp_list[|i];
			
		if !target_owner and target == owner{
			continue	
		}
			
		if jumps_left>0 and target.electrified<.01{
			target.electrified = 1;
			jumps_left--;
			ds_list_add(list_of_targets,target);
		}
		
	}	
	
	ds_list_destroy(temp_list);

}


get_targets();


