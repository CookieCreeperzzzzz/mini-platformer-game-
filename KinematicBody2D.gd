extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = 20
const speed = 200
const jump_height = -720
var motion = Vector2()

func _ready():
	print("yo ready")
	position.x = 400

func _physics_process(delta):
	
	#movement
	$AnimatedSprite.animation = "left"
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	
	else: 
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_height
	
	#amination
	if (motion.x < 0):
		$AnimatedSprite.play ("left")
	
	elif (motion.y == 0 || motion.x == 0):
		
		$AnimatedSprite.play ("default")
		$AnimatedSprite.play ("default")
		
	if motion.x != 0:
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.flip_h = motion.x < 0
		
	if (motion.y > 0 && is_on_floor() == false):
		$AnimatedSprite.play ("down")
		
	#collisiondetection
	#var slideCount = get_slide_count()
	#if (slideCount > 0):
		#print("collided")
		#for i in slideCount:
		#	var kc = get_slide_collision(i)
		#	var c = kc
		#	if (c.is_in_group):
			
		
	
	motion = move_and_slide(motion, UP)
	
	if (position.y > 4000):
		print("you dead ha ha!")
		get_tree().change_scene("res://world.tscn")
		
		
	if (position.x > 14276.28418):
		print("you win")
		
		
func _on_PlayerBody_body_entered(body):
	if body.is_in_group("mobs"):
		get_tree().change_scene("res://world.tscn")
	else:
		pass
	
	
	

