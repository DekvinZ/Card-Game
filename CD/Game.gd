extends Node2D

var playerHandPosition = [Vector2(250, 535), Vector2(350, 535), Vector2(450, 535), Vector2(550, 535), Vector2(650, 535)]
onready var cards = $GameCardDeck.deck
var hand
var eHand
var deck
var eDeck
var passengers = 0
var enemy_passengers = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	cards.shuffle()
	
	for pos in playerHandPosition:
		if (cards.size() != 0):
			var card = cards[0].duplicate()
			card.description = cards[0].description
			cards.remove(0)
			card.position = pos
			add_child(card)
			card.add_to_group("hand")
	
	$GameCardDeck.checkCount()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Card_input_event(viewport, event, shape_idx):
	if (Input.is_mouse_button_pressed(1)):
		printt(viewport, event, shape_idx)
	pass # Replace with function body.


func _on_Card2_input_event(viewport, event, shape_idx):
	if (Input.is_mouse_button_pressed(1)):
		printt(viewport, event, shape_idx)
	pass # Replace with function body.


func _on_Button_button_down():
	var i = 0
	var hand = get_tree().get_nodes_in_group("hand")
	var lastSpot = Vector2.ZERO
	if (hand.size() != 0):
		for pos in playerHandPosition:
			if (i < hand.size() ):
				hand[i].position = pos
				i += 1
			else:
				var card = cards[0].duplicate()
				cards.remove(0)
				card.position = pos
				add_child(card)
				card.add_to_group("hand")
				break
	else:
		var card = cards[0].duplicate()
		cards.remove(0)
		card.position = playerHandPosition[0]
		add_child(card)
		card.add_to_group("hand")
	
	$GameCardDeck.checkCount()
	
	# Результат окончания хода
	var vect = [false, false]
	var using = get_tree().get_nodes_in_group("used")
	
	for card in using:
		if (card.type == "auto"):
			vect[0] = true
		if (card.description == "driver"):
			vect[1] = true
	
	if (vect == [true, true]):
		passengers = 2
	
		for card in using:
			if (card.description == "conductor"):
				passengers += 1
				
			if (card.description == "advertisement"):
				if (card.stop == 0):
					passengers += 2
					card.position = Vector2(495, 245)
					card.remove_from_group("used")
					card.add_to_group("bin")
					
			if (card.description == "noABS"):
				var enemyHand = get_tree().get_nodes_in_group("enemyHand")
				for eCard in enemyHand:
					if (eCard.description == "advertisement"):
						if (enemy_passengers - 2 <= 0):
							enemy_passengers = 0
						else:
							enemy_passengers -= 2
						eCard.queue_free()
	
	using = get_tree().get_nodes_in_group("used")
	
	for card in using:
		if (card.description == "advertisement"):
			if (card.stop == 1):
				card.stop -= 1
			elif (card.stop == 0):
				card.position = Vector2(495, 245)
				card.check = false
				card.remove_from_group("used")
				card.add_to_group("bin")
	
	$ProgressPlayer1.value += passengers
	passengers = 0
#			if (card.description == "noABS"):
#				if ()
	pass # Replace with function body.


func _on_ProgressPlayer1_value_changed(value):
	if (value >= $ProgressPlayer1.max_value):
		$Button.disabled = true
		$Node2D/Label.visible = true
	pass # Replace with function body.
