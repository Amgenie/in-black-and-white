extends CharacterBody2D

class_name Player

@onready var sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

var is_alive : bool = true

func _physics_process(delta):
	
	if !is_alive: 
		return
	else: #movement script
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sound.play()

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		match direction:
			1.0:
				sprite.frame = 1
			-1.0:
				sprite.frame = 2
			0.0:
				sprite.frame = 0


	move_and_slide()
