/// @func lightning_strike_simple(start_x,start_y,target_object,max_range,max_jumps,precise_collision,function)
/// @desc 
/// @pure
/// @arg {Real} start_x
/// @arg {Real} start_y
/// @arg {Asset.GMObject} target_object
/// @arg {Real} max_range
/// @arg {Real} max_jumps
/// @arg {Bool} precise_collision
/// @arg {Function} [function]
/// @returns Array
function lightning_strike_simple(start_x,start_y,target_object,max_range,max_jumps,precise_collision,func=undefined){
	var targets_list = []
	var temp_list = ds_list_create();
	var targets_found = collision_circle_list(start_x,start_y,max_range,target_object,precise_collision,false,temp_list,true)	
		
	for(var i=0;i<min(targets_found,max_jumps+1);i++){
		var target = temp_list[|i];

		if !is_undefined(func) {
			func(target)
		}
			
		if instance_exists(target){
			array_push(targets_list,target);		
		}		
	}	
	
	ds_list_destroy(temp_list);
	return targets_list;
}

/// @func lightning_strike(start_x,start_y,target_object,max_range,max_jumps,precise_collision,function)
/// @desc 
/// @pure
/// @arg {Real} start_x
/// @arg {Real} start_y
/// @arg {Asset.GMObject} target_object
/// @arg {Real} max_range
/// @arg {Real} max_jumps
/// @arg {Bool} precise_collision
/// @arg {Function} [function]
/// @returns Array
function lightning_strike(start_x,start_y,target_object,max_range,max_jumps,precise_collision,func=undefined){
	var jumps_left = max_jumps;
	
	var targets_found = 0;
	var targets_list = []
	var targets_visited = ds_map_create();	
	var temp_list  = ds_list_create();
	
	var current_target = instance_nearest(start_x,start_y,target_object);
	if current_target==noone or point_distance(start_x,start_y,current_target.x,current_target.y)>=max_range{
		current_target=noone
	}

	while(current_target!=noone){
		ds_list_clear(temp_list)
		targets_found = collision_circle_list(current_target.x,current_target.y,max_range,target_object,precise_collision,false,temp_list,true)	
		
		current_target = noone;
		
		for(var i=0;i<targets_found;i++){
			var target = temp_list[|i];
			
			if jumps_left>0 and !ds_map_exists(targets_visited,target){
				jumps_left--;
				ds_map_add(targets_visited,target,0)
				
				if !is_undefined(func) {
					func(target)
				}
				
				if instance_exists(target){
					array_push(targets_list,target);
					current_target = target
				}
				
				break;
				
			}
		
		}	
	}

	ds_list_destroy(temp_list);
	ds_map_destroy(targets_visited);
	
	return targets_list;
}