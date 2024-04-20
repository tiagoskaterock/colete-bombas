extends Node2D

var points = 0
var pre_bomba = preload("res://scenes/bomba.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(points)
