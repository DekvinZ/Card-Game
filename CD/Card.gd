extends Area2D

export var type : String
export var picture : StreamTexture
var description
var check : bool = false
var placed : bool = false
var stop = 1

func _ready():
	$Sprite.texture = picture
	pass 

func setPicture(picture):
	self.picture = picture
	pass

func _on_Card_input_event(viewport, event, shape_idx):
	if (Input.is_mouse_button_pressed(1)):
		if (!check && !placed):
			var hand = get_tree().get_nodes_in_group("hand")
			for card in hand:
				if (card.check):
					card.check = false
					print(card)
			check = true
	pass
