extends KinematicBody2D

var speed = 400

func _process(delta):
	handle_input(delta)

func handle_input(delta):
	handle_left(delta)
	handle_right(delta)
		
func handle_left(delta):
	if Input.is_action_pressed("go_left"):
		go_left(delta)
	
func handle_right(delta):
	if Input.is_action_pressed("go_right"):
		go_right(delta)
				
func go_left(delta):	
	anda_para_esquerda(delta)
	olha_para_esquerda(delta)
		
func go_right(delta):	
	anda_para_direita(delta)
	olha_para_direita(delta)
	
func olha_para_direita(delta):
	$sprite.flip_h = false
	$shape.position.x = 24
	
func olha_para_esquerda(delta):
	$sprite.flip_h = true
	$shape.position.x = -24
	
func anda_para_direita(delta):
	if position.x < get_viewport_rect().size.x - 50:
		position.x += speed * delta
		
func anda_para_esquerda(delta):
	if position.x > 50:
		position.x -= speed * delta
