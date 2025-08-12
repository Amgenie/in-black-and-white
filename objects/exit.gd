extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var exit_sound = $ExitSound

var unlocked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Eventsbus.exit_open.connect(_on_exit_open)
	sprite.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_open():
	unlocked = true
	sprite.frame = 1
	exit_sound.play()

func _on_body_entered(body):
	if body is not Player:
		return
	elif body is Player:
		if unlocked:
			Eventsbus.level_complete.emit()
	else:
		print(body)
