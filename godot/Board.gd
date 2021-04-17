extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Piece = preload("res://Piece.tscn")

var board_tiles

var board_width
var board_height

var tile

func init_board_tiles(w, h): #todo hardcoded size as 15
	board_height = h
	board_width = w
	
	board_tiles = []
	for i in range(h):
		var l = []
		for j in range(w):
			l.append(null)
		board_tiles.append(l)


# Called when the node enters the scene tree for the first time.
func _ready():
	#var scene = load("res://Piece.tscn") #load scene
	#var scene = preload("res://MyScene.tscn") #preloading while compile
	
	init_board_tiles(15, 15)
	
	var instance = Piece.instance()
	add_child(instance)
	#instance.position.x = 100
	#instance.position.y = 100
	
	var pos = Vector2(2,3) 
	put_piece_on_board(instance, pos)
	print("hello world")
	#var newPiece = Piece.new("g",5)	
	
	pass # Replace with function body.



func put_piece_on_board(piece, pos: Vector2):
	if(pos.x < 0 || pos.x >= board_width):
		return false
	if(pos.y < 0 || pos.y >= board_height):
		return false
	if(board_tiles[pos.x][pos.y] != null):
		return false
	
	#put on board
	board_tiles[pos.x][pos.y] = piece
	var world_pos = get_child(0).map_to_world(pos) + get_child(0).cell_size/2
	piece.position = world_pos
	return true
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
