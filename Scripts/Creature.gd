extends Node2D
class_name Creature
@export var sprite: AnimatedSprite2D
@export var creature_name: String
@export var pos: Vector2:
	set(new_pos):
		pos[0] = clamp(new_pos[0], 0, 11)
		pos[1] = clamp(new_pos[1], 0, 11)
@export var max_hp: int
@export var curr_hp: int:
	set(new_curr_hp):
		curr_hp = clamp(new_curr_hp, 0, max_hp)
@export var sprite_pos: Vector2
@export var speed: int
var move_path: Array
var contant_elements: Array
@export var mp: int
@export var selected_elements: Array
@export var accuracy: int
@export var dodge: int
@export var resistances: Dictionary
var HealthBarScene = preload("res://Scenes/HealthBar.tscn")
var small_health_bar: HealthBar = HealthBarScene.instantiate()
#var big_health_bar: HealthBar = HealthBarScene.instantiate()



# Called when the node enters the scene tree for the first time.
func _ready():
	updateSpritePos()
	add_child(small_health_bar)
	small_health_bar.setValues(curr_hp, 500, 40, max_hp, curr_hp, pos)
	#big_health_bar.setValues(curr_hp, 400, 40, max_hp, curr_hp, Vector2(1000, 1000))
	#add_child(big_health_bar)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("leftClick"):
		curr_hp -= 20
		small_health_bar.updateTargetHealth(curr_hp)
	if Input.is_action_just_pressed("rightClick"):
		curr_hp += 20
		small_health_bar.updateTargetHealth(curr_hp)
	
func _init(creature_name: String, pos: Vector2, hp: int, curr_hp: int,
	speed: int, mp: int, accuracy:float, resistances: Dictionary):
	self.creature_name = creature_name
	#sprite = getSprite(self, name)
	self.pos = pos
	self.max_hp = hp
	self.curr_hp = curr_hp
	self.speed = speed
	self.move_path = []
	self.constant_elements = []
	self.mp = mp
	self.selected_elements = []
	self.accuracy = accuracy
	self.dodge = dodge
	self.resistances = resistances
	self.sprite_pos = Vector2(0, 0)
	#self.small_health_bar = 
	#self.big_health_bar =

func updateSpritePos():
	sprite.global_position.x = pos.x * 425 - pos.y * 425  + 5587
	sprite.global_position.y = pos.y * 200 + pos.x * 200 + 250

func updatePos():
	updateSpritePos()
	small_health_bar.updatePos(pos)

func move(newpos):
	self.pos = newpos
	updatePos()
	
func select():
	for elt in selected_elements:
		elt.visible = true
