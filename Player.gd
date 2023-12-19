extends Area2D
@export var Speed = 400
@onready var bg_music = $"../Bg music"
@onready var enemy_hit = $"../Enemy hit"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() >0:
		velocity = velocity.normalized() * Speed
	position += velocity * delta 
	
func _on_body_entered(body):
	hide()
	enemy_hit.play()
	bg_music.stop() 
	
	
