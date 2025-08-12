extends Area2D

@onready var sprite = $AnimatedSprite2D

var is_on: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if is_on:
		return
	if body is Player:
		sprite.frame = 1
		is_on = true
		Eventsbus.exit_open.emit()
		print("exit open")
