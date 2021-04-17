extends Node2D

class_name Board


var Piece = preload("res://Piece.tscn")

var board_tiles

var board_width : int
var board_height : int

var tilemap : TileMap

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
	tilemap = get_node("TileMap")
	init_board_tiles(15, 15)
	
	var instance = Piece.instance()
	instance.constructor(self, "h",5);
	add_child(instance)
	#instance.position.x = 100
	#instance.position.y = 100
	
	var pos = Vector2(2,3) 
	put_piece_on_board_cell(instance, pos)
	print("hello world")
	#var newPiece = Piece.new("g",5)	
	
	pass # Replace with function body.



func put_piece_on_board_cell(piece: Piece, pos: Vector2):
	if(pos.x < 0 || pos.x >= board_width):
		return false
	if(pos.y < 0 || pos.y >= board_height):
		return false
	if(board_tiles[pos.x][pos.y] != null \
	and board_tiles[pos.x][pos.y] != piece):
		return false
		
	
	#put on board
	piece.change_parent(self)
	board_tiles[pos.x][pos.y] = piece
	var world_pos = tilemap.map_to_world(pos) + tilemap.cell_size/2
	piece.position = world_pos
	return true
		
func put_piece_on_board_world(piece, pos:Vector2):
	var cell_pos = tilemap.world_to_map(pos)
	return put_piece_on_board_cell(piece, cell_pos)



#func snap_position_to_board(position:Vector2):
#	var tilemap_position = tilemap.world_to_map(position)
#	var snapped_position = tilemap.map_to_world(tilemap_position) + tilemap.cell_size/2
#	return snapped_position
