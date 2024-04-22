extends AudioStreamPlayer

func _ready():
	play()

func _on_explosao_finished():
	print('termina')
	queue_free()
