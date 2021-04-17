extends Node2D


class_name Piece


var value
var letter

var board 


#func _init(letter, value):
#	value = value
#	letter = letter
#	print(letter, value)
	
	
func constructor(brd, let:String, val:int):
	self.board = brd
	self.letter = let
	self.value = val

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func move_to(target):
	position = board.snap_position_to_board(target)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
