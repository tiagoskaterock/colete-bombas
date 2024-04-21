extends Area2D

var speed
const GRAVITY_ACCEL = 1.04
const LEVEL_UP_ADD = .1

func _ready():
	speed = get_parent().get_bomba_speed()

func _process(delta):
	speed *= GRAVITY_ACCEL
	position.y += speed * delta
	
func _on_bomb_body_entered(body):
	if body.name == 'player':
		destroy()
		add_point()
		handle_level_up()
	
func handle_level_up():
	if get_points() % 5 == 0: 
		level_up(LEVEL_UP_ADD)

func level_up(how_much):
	get_parent().set_bomba_speed(get_parent().get_bomba_speed() + how_much)
	print("LEVEL UP!!! speed is now: " + str(get_parent().get_bomba_speed()))
	
func add_point(): 
	get_parent().add_point()
	
func destroy(): 
	queue_free()

func get_points(): 
	return get_parent().get_points()
	
