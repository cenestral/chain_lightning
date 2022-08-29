cooldown++
if cooldown>cooldown_max{instance_destroy()}

var prev_x = x;
var prev_y = y;

for(var i=0;i<array_length(points);i++){
	var point = points[i];
	
	draw_line_width(prev_x,prev_y,point[0],point[1],4*(1-cooldown/cooldown_max))
	prev_x = point[0];
	prev_y = point[1];
		
}
