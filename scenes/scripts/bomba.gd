extends Area2D

var speed
const GRAVITY_ACCEL = 1.03
const LEVEL_UP_ADD = .1
const PRE_FUMACA = preload("res://scenes/fumaca.tscn")
const PRE_RASTRO = preload("res://scenes/rastro.tscn")
const PRE_SOM_DE_EXPLOSAO = preload("res://scenes/explosao.tscn")
const PRE_SOM_DE_PEGAR = preload("res://scenes/catch.tscn")
const RASTRO_ACIMA_DA_BOMBA_EM_PIXELS = 30
const TEMPO_ENTRE_RASTROS_EM_SEGUNDOS = 0.1

func _ready():
	$TimerRastro.wait_time = TEMPO_ENTRE_RASTROS_EM_SEGUNDOS
	$TimerRastro.start()
	speed = get_parent().get_bomba_speed()

func _process(delta):
	speed *= GRAVITY_ACCEL
	position.y += speed * delta
	
func _on_bomb_body_entered(body):
	if body.name == 'player':
		player_pegou_bomba()
	
func handle_level_up():
	if get_points() % 5 == 0: 
		level_up(LEVEL_UP_ADD)

func level_up(how_much):
	get_parent().set_bomba_speed(get_parent().get_bomba_speed() + how_much)
	print("LEVEL UP!!! speed is now: " + str(get_parent().get_bomba_speed()))
	
func add_point(): 
	get_parent().add_point()
	
func player_pegou_bomba():
	toca_som_de_pegar()
	add_point()
	handle_level_up()
	queue_free()
	
func toca_som_de_pegar():
	var som_de_pegar = PRE_SOM_DE_PEGAR.instance()
	get_parent().add_child(som_de_pegar)	

func get_points():
	return get_parent().get_points()
	
func _on_bomb_area_entered(area):
	if area.name == 'chao':
		bateu_no_chao()

func bateu_no_chao():
	toca_som_de_explosao()
	mostra_fumaca()
	get_parent().perde_ponto()
	queue_free()	
	
func mostra_fumaca():
	var fumaca = PRE_FUMACA.instance()
	fumaca.position = position
	get_parent().add_child(fumaca)
	fumaca.play("default")
	
func toca_som_de_explosao():
	var explosao = PRE_SOM_DE_EXPLOSAO.instance()
	get_parent().add_child(explosao)
	
func mostra_rastro():
	var rastro = PRE_RASTRO.instance()
	rastro.position.x = position.x
	rastro.position.y = position.y - RASTRO_ACIMA_DA_BOMBA_EM_PIXELS
	get_parent().add_child(rastro)
	
func _on_TimerRastro_timeout():
	mostra_rastro()
