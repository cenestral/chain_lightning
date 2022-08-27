cooldown++
if cooldown>cooldown_max{instance_destroy()}

var prev_x = x;
var prev_y = y;
for(var i=0;i<ds_list_size(list_of_targets);i++){
	var target = list_of_targets[|i];
	draw_line_width(prev_x,prev_y,target.x,target.y,3*(1-cooldown/cooldown_max))
	prev_x = target.x;
	prev_y = target.y;
		
}

draw_self()
