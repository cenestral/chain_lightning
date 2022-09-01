points = [];

//just for fanciness
cooldown = 0
cooldown_max = 40;


draw_lightning = function(x1,y1,x2,y2,width){
	var dst = point_distance(x1,y1,x2,y2)
	var dir = point_direction(x1,y1,x2,y2)+random_range(-4,4)
	
	var mx=x1+lengthdir_x(dst/2,dir)
	var my=y1+lengthdir_y(dst/2,dir)
	
	draw_set_color(c_blue)
	draw_line_width(x1,y1,x2,y2,width*1.1*random_range(.9,1.1));
	
	
	draw_set_color(#0051e5)
	draw_line_width(x1,y1,mx,my,width*random_range(.9,1.1));	
	draw_line_width(mx,my,x2,y2,width*random_range(.9,1.1));	
	draw_circle(x1,y1,width*.8,false)
	draw_circle(x2,y2,width*.8,false)
	draw_circle(mx,my,width*.6,false)
	
	draw_set_color(c_white)
	draw_line_width(x1,y1,x2,y2,width*.5*random_range(.9,1.1));	
	
	
}



