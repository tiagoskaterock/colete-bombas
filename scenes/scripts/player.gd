extends KinematicBody2D

var speed = 400

func _process(delta):
	handle_input(delta)

func handle_input(delta):
	if Input.is_action_pressed("go_left"):
		go_left(delta)
	if Input.is_action_pressed("go_right"):
		go_right(delta)
		
func go_left(delta):
	var left_limit = 50
	if position.x > left_limit:
		position.x -= speed * delta
	$sprite.flip_h = true
	$shape.position.x = -24
		
func go_right(delta):
	var right_limit = get_viewport_rect().size.x - 50
	if position.x < right_limit:
		position.x += speed * delta
	$sprite.flip_h = false
	$shape.position.x = 24
