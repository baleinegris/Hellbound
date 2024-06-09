extends CharacterBody2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var label = $Label
var mouse_in = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _on_mouse_shape_entered(shape_idx):
	mouse_in = str(true)
	label.text = mouse_in 


func _on_mouse_shape_exited(shape_idx):
	mouse_in = str(false)
	label.text = mouse_in
