extends Area2D

export var full = false
export var type : String
var cardd

func _on_Area_For_input_event(viewport, event, shape_idx):
	if (Input.is_mouse_button_pressed(1)):
		
		var hand = get_tree().get_nodes_in_group("hand")
		for card in hand:
			if (card.check && !full && type == card.type):
				card.position = get_global_position()
				if (card.type == "auto"):
					card.rotation_degrees = 90
				card.placed = true
				card.remove_from_group("hand")
				card.add_to_group("used")
				card.check = false
				print(hand)
				full = true
				cardd = card
	
	pass 
