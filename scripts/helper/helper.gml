function place_instance(xmin,ymin,xmax,ymax,object,min_distance,amount){
	var max_tries = 50;
	var tries = 0

	repeat(amount){
		
		do{
			var rx = irandom_range(xmin,xmax);
			var ry = irandom_range(ymin,ymax);	
			tries++
		}
		until((collision_circle(rx,ry,min_distance,object,true,true)==noone or tries>max_tries))
		if tries<max_tries{
			instance_create_layer(rx,ry,"Instances",object)
		}
	}

}