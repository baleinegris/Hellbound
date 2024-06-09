extends Node2D
@onready var knight = $Knight


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('D'):
		knight.move(Vector2(knight.pos[0] + 1, knight.pos[1]))
	if Input.is_action_just_pressed('A'):
		knight.move(Vector2(knight.pos[0] - 1, knight.pos[1]))
	if Input.is_action_just_pressed('S'):
		knight.move(Vector2(knight.pos[0], knight.pos[1] + 1))
	if Input.is_action_just_pressed('W'):
		knight.move(Vector2(knight.pos[0], knight.pos[1] - 1))
