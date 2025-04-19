extends Area2D

@export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var facing_direction = 3 # What direction character is facing. 1=up, 2=left, 3=down, 4=right

# Initializes on start
func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
		facing_direction = 4
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		facing_direction = 2
	if Input.is_action_pressed("down"):
		velocity.y += 1
		facing_direction = 3
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		facing_direction = 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.length() > 0:
		# set appropriate run animation
		if velocity.x > 0:
			$AnimatedSprite2D.animation = "runRight"
		elif velocity.x < 0:
			$AnimatedSprite2D.animation = "runLeft"
		elif velocity.y < 0:
			$AnimatedSprite2D.animation = "runUp"
		elif velocity.y > 0:
			$AnimatedSprite2D.animation = "runDown"
		$AnimatedSprite2D.play()
	else:
		# set appropriate idle animation
		if facing_direction == 1:
			$AnimatedSprite2D.animation = "idleUp"
		elif facing_direction == 3:
			$AnimatedSprite2D.animation = "idleDown"
		elif facing_direction == 2:
			$AnimatedSprite2D.animation = "idleLeft"
		elif facing_direction == 4:
			$AnimatedSprite2D.animation = "idleRight"
		$AnimatedSprite2D.play()
