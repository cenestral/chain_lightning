draw_self()
electrified=lerp(electrified,0,.1)
image_blend = merge_color(c_blue,c_white,electrified)

draw_circle(mouse_x,mouse_y,RANGE,true)
