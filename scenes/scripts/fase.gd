extends Node2D

var points = 0
var pre_bomba = preload("res://scenes/bomba.tscn")
var bomba_speed = 1
var bomba_wait_time_em_segundos = .3
const PONTOS_PERDIDOS_AO_BATER_NO_CHAO = 3

func _ready():	
	randomize()
	start_bombas()
	
func start_bombas():
	$"timer_bomba".wait_time = bomba_wait_time_em_segundos
	$"timer_bomba".start()
	
func _on_timer_bomba_timeout():
	add_bomba()
	
func add_point():
	points += 1
	update_points()
	
func add_bomba():
	var bomba = pre_bomba.instance()
	bomba.position.x = sorteia_bomba_position_x()
	bomba.position.y = -50
	add_child(bomba)
	
func sorteia_bomba_position_x():
	return rand_range(50, get_viewport_rect().size.x - 50)
	
func get_points(): 
	return points
	
func get_bomba_speed():
	return bomba_speed
	
func set_bomba_speed(new_bomba_speed):
	bomba_speed = new_bomba_speed
	
func update_points():
	$"Label".text = str(get_points())
	
func perde_ponto():
	if get_points() > 0 + PONTOS_PERDIDOS_AO_BATER_NO_CHAO:
		points -= PONTOS_PERDIDOS_AO_BATER_NO_CHAO
	else:
		zera_pontos()
	update_points()
		
func zera_pontos():
	points = 0
