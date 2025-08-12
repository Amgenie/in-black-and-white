extends Node

@export var next_scene : String 
@onready var animation_player = $AnimationPlayer
@onready var level_complete = $"Level Complete"
@onready var player = $Player



# Called when the node enters the scene tree for the first time.
func _ready():
	Eventsbus.game_over.connect(_on_game_over)
	Eventsbus.level_complete.connect(on_level_complete)
	level_complete.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_game_over():
	get_tree().reload_current_scene()


func on_level_complete():
	print("level finished!!!")
	player.hide()
	player.is_alive = false #just stops the player from moving
	animation_player.play("transition")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(next_scene)
