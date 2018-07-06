extends KinematicBody2D


const GRAVITY = 20
var motion = Vector2(35,20)
var moveTimer = 0
var moveTimerThreshold = 5

func _ready():
	add_to_group("mobs")

func _physics_process(delta):
	
	
	moveTimer += delta
	
	if (moveTimer > moveTimerThreshold):
		motion.x = motion.x * -1
		moveTimer = 0
		
	
	motion.y += GRAVITY
	move_and_slide(motion)