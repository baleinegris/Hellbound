class_name Encounter
extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _init():
	"""Initializes this Encounter"""
	var grid: Array[Array]
	var creatures: Array[Creature]
	var characters: Array[Creature]
	var objects: Array
	var active_turn: Creature
	var inventory: Array

func _isValidPos(pos) -> bool:
	"""Checks whether this position is a valid position in the grid"""
	return 0 <= pos[0] <= 11 and 0 <= pos[1] <= 11

