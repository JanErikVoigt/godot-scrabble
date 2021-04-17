extends Area2D


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		get_node("/root/Main/World/Hand").clicked_on_piece(get_parent())
