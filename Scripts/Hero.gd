extends Creature
class_name Hero


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	print("Hero ready with initial health: ", curr_hp)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)

func _init():
	pass
