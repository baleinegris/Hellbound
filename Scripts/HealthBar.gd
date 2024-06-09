extends Node2D
class_name HealthBar
@export var curr_health: float
@export var length: int
@export var height: int
@export var max_health: float
@export var target_health: float:
	set(new_health):
		target_health = clamp(new_health, 0, max_health)
		#updateHealthBar()

@export var pos: Vector2
#@onready var label = $Label
@export var health_bar_change_speed: float
var color: Color = Color8(200, 30, 20)
var health_ratio: float
var transition_color: Color
var transition_width = 0
var curr_health_bar = Rect2(pos, Vector2(curr_health * health_ratio, height))
var target_health_bar = Rect2(Vector2(pos[0] + curr_health_bar.end[0], pos[1]), Vector2(transition_width, height))
var outline: Rect2
#func _init(curr_health, length, height, max_health, target_health, pos):
	#self.curr_health = curr_health
	#self.length = length
	#self.height = height
	#self.max_health = max_health
	#self.target_health = target_health
	#self.pos = pos

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_health = 0.0
	target_health = curr_health

func _process(delta):
	#label.text = str(int(target_health))
	#print("Current Health: ", curr_health, " Target Health: ", target_health)
	if curr_health < target_health:
		curr_health = clamp(curr_health + health_bar_change_speed * delta, 0, target_health)
	elif curr_health > target_health:
		curr_health = clamp(curr_health - health_bar_change_speed * delta, target_health, max_health)
	updateHealthBar()
	queue_redraw()
	#print("Updated Current Health: ", curr_health)

func updateHealthBar():
	if curr_health > target_health:
		transition_width = ((target_health - curr_health) * health_ratio)
		transition_color = Color(0.6, 0.1, 0.1)
		
	elif target_health > curr_health:
		transition_width = ((target_health - curr_health) * health_ratio)
		transition_color = Color(0.5, 0.8 , 0)

	curr_health_bar.size  = Vector2(curr_health * health_ratio, height)
	target_health_bar.size = Vector2(int(transition_width), height)
	target_health_bar.position = Vector2(curr_health_bar.end[0], 0)
	
func _draw():
	draw_rect(outline, Color(0, 0, 0))
	draw_rect(curr_health_bar, color)
	draw_rect(target_health_bar, transition_color)

func updatePos(pos: Vector2):
	"""Pos is the coordinated of the grid!"""
	global_position.x = pos.x * 425 - pos.y * 425  + 5372.2
	global_position.y = pos.y * 200 + pos.x * 200 + 600

func updateTargetHealth(new_health):
	target_health = new_health
	print("Target health updated to : " + str(target_health))

	#print('curr health: ' + str(curr_health))
func updateCurrHealth(new_health):
	curr_health = new_health

func _to_string():
	return "curr health: " + str(curr_health)  + " max health: " + str(max_health) + " target health: " + str(target_health)
	
func setValues(curr_health, length, height, max_health, target_health, pos):
	self.curr_health = curr_health
	self.length = length
	self.height = height
	self.max_health = max_health
	self.target_health = target_health
	curr_health_bar = Rect2(pos, Vector2(curr_health * health_ratio, height))
	target_health_bar = Rect2(Vector2(pos[0] + curr_health_bar.end[0], pos[1]), Vector2(transition_width, height))
	outline = Rect2(pos, Vector2(length, height))
	updatePos(pos)
	health_bar_change_speed = length/10
	health_ratio = length / max_health
