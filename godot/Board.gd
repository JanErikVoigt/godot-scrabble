extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Piece = preload("res://Piece.tscn")

var board_tiles

func init_board_tiles(size): #todo hardcoded size as 15
	board_tiles = []
	for i in range(15):
		var l = []
		for j in range(15):
			l.append(null)
		board_tiles.append(l)


# Called when the node enters the scene tree for the first time.
func _ready():
	#var scene = load("res://Piece.tscn") #load scene
	#var scene = preload("res://MyScene.tscn") #preloading while compile
	
	init_board_tiles(15)
	
	var instance = Piece.instance()
	#instance.position.x = 100
	#instance.position.y = 100
	
	add_child(instance)
	print("hello world")
	#var newPiece = Piece.new("g",5)	
	
	pass # Replace with function body.



func put_piece_on_board(piece, position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
