extends AudioStreamPlayer

func _ready():
	play()

func _on_catch_finished():
	queue_free()
