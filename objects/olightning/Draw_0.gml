cooldown++
if cooldown>cooldown_max{instance_destroy()}

var prev_x = x;
var prev_y = y;

for(var i=0;i<array_length(points);i++){
	var point = points[i];
	
	var tween = (1-cooldown/cooldown_max);
	tween*=tween;
	
	draw_lightning(prev_x,prev_y,point[0],point[1],8*tween);
	
	prev_x = point[0];
	prev_y = point[1];
		
}
