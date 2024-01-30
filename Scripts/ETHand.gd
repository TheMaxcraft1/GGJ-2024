extends Sprite2D

var can_move
var dragging = false
var of = Vector2(0,0)

func _process(delta):
	
	if can_move:
		if dragging:
			position = position.lerp(get_global_mouse_position() - of, delta * 20)
		
	if position.x > 362:
		position.x = 362
	elif position.x < -154:
		position.x = -154 
	elif position.y > 570:
		position.y = 570
	elif position.y < 236:
		position.y = 236
	

func _on_button_button_up():
	dragging = false


func _on_button_button_down():
	dragging = true
	of = get_global_mouse_position() - global_position
	
