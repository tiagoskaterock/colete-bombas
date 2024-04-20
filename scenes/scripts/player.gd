extends KinematicBody2D

var speed = 400
var input = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _process(delta):
	handle_input(delta)
	move_and_slide(input)

func handle_input(delta):
	if Input.is_action_pressed("go_left"):
		go_left(delta)
	if Input.is_action_pressed("go_right"):
		go_right(delta)
		
func go_left(delta):
	position.x -= speed * delta
	$sprite.flip_h = true
		
func go_right(delta):
	position.x += speed * delta
	$sprite.flip_h = false
