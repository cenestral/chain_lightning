function lightning_strike_simple(start_x,start_y,target_object,max_range,max_jumps,precise_collision,func=undefined){
	var temp_list  = ds_list_create();
	var targets_list = []
	var jumps_left = max_jumps;
	var targets_found = collision_circle_list(start_x,start_y,max_range,target_object,precise_collision,false,temp_list,true)	
		
	for(var i=0;i<targets_found;i++){
		var target = temp_list[|i];
			
		if jumps_left>0 and target.electrified<.01{
			jumps_left--;
			target.electrified = 1;
			
			if !is_undefined(func) {
				func(target)
			}
			
			if instance_exists(target){
				array_push(targets_list,target);		
			}
		}
		
	}	
	
	with(instance_create_layer(start_x,start_y,"Instances",oLightning)){
		for(var i=0;i<array_length(targets_list);i++){
			var target = targets_list[i];
			array_push(points,[target.x,target.y])
		}
	}
	
	ds_list_destroy(temp_list);
	return targets_list;
}

function lightning_strike(start_x,start_y,target_object,max_range,max_jumps,precise_collision,func=undefined){

	var targets_found = 0;
	var targets_list = []
	var temp_list  = ds_list_create();
	var temp_queue = ds_queue_create()
	var jumps_left = max_jumps;
	var current_target = noone;
	
	var first_instance = collision_circle(start_x,start_y,max_range,target_object,precise_collision,true);
	
	if first_instance==noone{return targets_list}
	
	ds_queue_enqueue(temp_queue,first_instance)
	
	while(!ds_queue_empty(temp_queue)){
		ds_list_clear(temp_list)
		
		current_target = ds_queue_dequeue(temp_queue);	
		targets_found = collision_circle_list(current_target.x,current_target.y,max_range,target_object,precise_collision,false,temp_list,true)	
		
		for(var i=0;i<targets_found;i++){
			var target = temp_list[|i];
				
			if jumps_left>0 and target.electrified<.01{
				jumps_left--;
				target.electrified = 1;
				
				if !is_undefined(func) {
					func(target)
				}
				
				if instance_exists(target){
					array_push(targets_list,target);
					ds_queue_enqueue(temp_queue,target);
				}
				
				break;
			}
		
		}	
	}
	
	with(instance_create_layer(start_x,start_y,"Instances",oLightning)){
		for(var i=0;i<array_length(targets_list);i++){
			var target = targets_list[i];
			array_push(points,[target.x,target.y])
		}
	}
	
	ds_queue_destroy(temp_queue);
	ds_list_destroy(temp_list);
	return targets_list;
}