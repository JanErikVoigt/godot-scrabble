extends Node2D


class_name Piece


var value
var letter

var board 


#func _init(letter, value):
#	value = value
#	letter = letter
#	print(letter, value)
	
	
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func constructor(board, letter:String, value:int):
	self.board = board
	self.letter = letter
	self.value = value

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func move_to(target):
	position = target
	
	
func end_move(target):
	board.put_piece_on_board_world(self,target)
