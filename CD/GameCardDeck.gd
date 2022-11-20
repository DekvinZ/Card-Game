extends Node2D

var deck = []
onready var cards = load("res://Card.tscn")
var deckMaxCards

func _ready():
	
	var card = cards.instance()
	card.scale = Vector2(0.3, 0.3)
	deckAdd(card, load("res://cards/taxi.png"), "auto", 2, "taxi")
	
	card = cards.instance()
	deckAdd(card, load("res://cards/marshrutka.png"), "auto", 2, "marshrutka")
	
	card = cards.instance()
	card.scale = Vector2(0.3, 0.3)
	deckAdd(card, load("res://cards/driver.png"), "no_auto", 1, "driver")
	
	card = cards.instance()
	card.scale = Vector2(0.3, 0.3)
	deckAdd(card, load("res://cards/conductor.png"), "no_auto", 2, "conductor")
	
	card = cards.instance()
	card.scale = Vector2(0.3, 0.3)
	deckAdd(card, load("res://cards/advertisement.png"), "no_auto", 4, "advertisement")
	
	card = cards.instance()
	card.scale = Vector2(0.3, 0.3)
	deckAdd(card, load("res://cards/noABS.png"), "no_auto", 4, "noABS")
	
	$Label.text = str(deck.size(), "/", deck.size())
	
	deckMaxCards = deck.size()
	pass # Replace with function body.

func deckAdd(card, picture : StreamTexture, type : String, count : int, description : String):
	for i in count:
		card.description = description
		card.picture = picture
		card.type = type
		deck.append(card)
	pass


func checkCount():
	$Label.text = str(deck.size(), "/", deckMaxCards)
	pass
