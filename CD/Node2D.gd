extends Node2D

var a = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	a += 1
	$Label.text = str(a)
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	a += 1
	$Label.text = str(a)
	pass # Replace with function body.
