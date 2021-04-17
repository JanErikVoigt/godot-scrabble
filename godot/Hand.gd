extends Node2D


var board
var world: Node2D
var piece_in_hand


# Called when the node enters the scene tree for the first time.
func _ready():
	world = get_node("/root/Main/World")
	board = world.get_node("Board")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(piece_in_hand != null):
		move_piece_in_hand()
	


func clicked_on_piece(piece):
	
	#pick up if hand is empty
	if(piece_in_hand == null):
		piece.change_parent(self)
		
		piece_in_hand = piece
		
	else:
		if(piece_in_hand == piece): #should always be the case
			#try to put it on board
			if(board.put_piece_on_board_world(piece_in_hand, world.get_local_mouse_position())):
				piece_in_hand = null
			elif(world.get_node("Rack").put_piece_on_rack_world(piece_in_hand)):
				piece_in_hand = null


func move_piece_in_hand():
	#piece_in_hand.position = get_global_mouse_position()
	piece_in_hand.move_to(world.get_local_mouse_position())
