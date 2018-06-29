extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = 20
const speed = 200
const jump_height = -550
var motion = Vector2()

func _physics_process(delta):
	$AnimatedSprite.animation = "left"
	motion.y += GRAVITY
	#movement
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		
	else: 
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_height
		
	motion = move_and_slide(motion, UP)
	
	#amination
	if (motion.y == 0 || motion.x == 0):
		print("default")
		$AnimatedSprite.play ("default")

	if (motion.y < 0):
		print("jump play default")
		$AnimatedSprite.play ("default")
		
	if (motion.y > 0):
		print("down")
		$AnimatedSprite.play ("down")
		
	if (motion.x < 0):
		print("left")
		$AnimatedSprite.play ("left")
		
	if (motion.x > 0):
		print("right place holder")
		$AnimatedSprite.play ("left")
