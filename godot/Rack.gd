extends Node2D


# Declare member variables here. Examples:
var size = 7
var tilesize = 64
var pieces = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(size):
		pieces.append(null)


func put_piece_on_rack_world(piece: Piece):
	#var cell_pos = tilemap.world_to_map(pos)
	
	var pos = get_local_mouse_position()
	if(pos.x > 0 and pos.x < tilesize * size):
		if(pos.y > 0 and pos.y < tilesize):
			#on rack
			piece.change_parent(self)
			piece.position = Vector2(round(pos.x / tilesize) * tilesize, tilesize/2)
			return true
			
	return false
		
	
	#return put_piece_on_board_cell(piece, cell_pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
