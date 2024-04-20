extends Area2D

var speed = 5

func _process(delta):
	position.y += speed
	
func _on_bomb_body_entered(body):
	if body.name == 'player':
		get_parent().points += 1
