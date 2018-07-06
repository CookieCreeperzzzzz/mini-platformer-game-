extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = 9.8
const speed = 200
const jump_height = -720
var motion = Vector2()

func _ready():
	add_to_group("mobs")



func _physics_process(delta):
	motion.x = 1
	#movement
	#$AnimatedSprite.animation = "left"
	motion.y += GRAVITY
	
	#if Input.is_action_pressed("ui_right"):
	#	motion.x = speed
	
	#elif Input.is_action_pressed("ui_left"):
	#motion.x =- speed
	
	#else: 
	#	motion.x = 0
		
	#if is_on_floor():
	#	if Input.is_action_just_pressed("ui_up"):
	#		motion.y = jump_height
	
		#$AnimatedSprite.play ("walk")
	
	#elif (motion.y == 0 || motion.x == 0):
	#	print("default")
	#	$AnimatedSprite.play ("default")

	#	print("jump play default")
	#	$AnimatedSprite.play ("default")
		
	
		
		#if motion.x != 0:
		#	$AnimatedSprite.animation = "walk"
		#	$AnimatedSprite.flip_h = motion.x < 0
		
	#if (motion.y > 0 && is_on_floor() == false):
	#	print("down")
	#	$AnimatedSprite.play ("down")
		
	motion = move_and_slide(motion, UP)
		
func _on_Player_body_entered(top_of_body):
	#hide() # Player disappears after being hit.
	#emit_signal("hit")
	#$CollisionShape2D.disabled = true
	pass
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

