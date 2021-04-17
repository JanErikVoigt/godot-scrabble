extends Control




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var mouse_moving


func start_moving():
	mouse_moving = true
	get_parent().move_to(get_global_mouse_position())
func stop_moving():
	mouse_moving = false
	get_parent().end_move(get_global_mouse_position())

func toggle_moving():
	if(mouse_moving):
		stop_moving()
	else:
		start_moving()

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		toggle_moving()
		
func _input(event):
	if event is InputEventMouseMotion:
		if mouse_moving:
			get_parent().move_to(get_global_mouse_position())
