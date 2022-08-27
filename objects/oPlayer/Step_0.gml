cooldown++
if cooldown>10{
	if mouse_check_button_pressed(mb_left){
		var lightning_id = instance_create_layer(mouse_x,mouse_y,"Instances",oLightningType0)
		lightning_id.owner=id;
		cooldown = 0;
	}
	
	if mouse_check_button_pressed(mb_right){
		var lightning_id = instance_create_layer(mouse_x,mouse_y,"Instances",oLightningType1)
		lightning_id.owner=id;
		cooldown = 0;
	}
}