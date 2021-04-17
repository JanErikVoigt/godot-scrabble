extends Area2D

var is_moving




# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func toggle_moving():
	if(is_moving):
		stop_moving()
	else:
		start_moving()

func start_moving():
	is_moving = true

func stop_moving():
	is_moving = false
	get_parent().move_to(get_global_mouse_position())


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		toggle_moving()
		
func _input(event):
	if event is InputEventMouseMotion:
		if is_moving:
			get_parent().move_to(get_global_mouse_position())
