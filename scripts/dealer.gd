extends Node
## This class will deal cards

@export var total_cards: int
@export var max_planets: int
@export var max_tech: int
@export var max_unforeseens: int
@export var max_special: int

var rng = RandomNumberGenerator.new()
var card_scene: PackedScene
var planets: Array
var planets_used: Array
var techs: Array
var techs_used: Array
var unforeseens: Array
var unforeseens_used: Array
var specials: Array
var specials_used: Array

func _ready() -> void:
	card_scene = load("res://scenes/card.tscn")
	planets = [["Jupiter", 0, 3, 1], ["Saturn", 3, 3, 1], ["Venus", 6, 0, 0],
			   ["X", 10, 10, 10], ["Sol", 2, 6, 0], ["Sirius", 1, 8, 2],
			   ["Kepler 452-b", 4, 4, 4], ["Horsehead Nebula", 7, 2, 0],
			   ["Earth", 5, 1, 1], ["Uranus", 1, 2, 3]]
	techs = [["Biomatter Materializer", card.TechBuff.NEGATE_NO_BIOMATTER], 
			 ["Biomatter Enhancer", card.TechBuff.NEGATE_NEGATIVE_BIOMATTER],
			 ["Energy Materializer", card.TechBuff.NEGATE_NO_ENERGY],
			 ["Energy Enhancer", card.TechBuff.NEGATE_NEGATIVE_ENERGY], 
			 ["Exotic Material Materializer", card.TechBuff.NEGATE_NO_EXOTIC],
			 ["Exotic Material Enhancer", card.TechBuff.NEGATE_NEGATIVE_EXOTIC],
			 ["Yessifier", card.TechBuff.IGNORE_NO], 
			 ["Research Manifold", card.TechBuff.BANK_PAYS_EXPLORE],
			 ["Energy Converter", card.TechBuff.CONVERT_E2M],
			 ["Passive Energy", card.TechBuff.GAIN_3E],
			 ["Von Nooman Probe", card.TechBuff.BANK_PAYS_EXPLORE],
			 ["Private Explorers", card.TechBuff.E_FOR_UF]]
	unforeseens = []
	specials = [["Starlord", card.SpecialBuff.PLUS_FOR_E],
				["Technotopia", card.SpecialBuff.PLUS_FOR_TECH],
				["Exophile", card.SpecialBuff.PLUS_FOR_MOST_EXO],
				["Meson Collector", card.SpecialBuff.PLUS_FOR_X],
				["Empire", card.SpecialBuff.PLUS_FOR_P],
				["Landlord", card.SpecialBuff.PLUS_FOR_MOST_M],
				["Energy Monopoly", card.SpecialBuff.PLUS_FOR_MOST_ENERGY],
				["Mass Attractor", card.SpecialBuff.PLUS_FOR_M]]
	for i in range(max_tech):
		var tech: Node2D = card_scene.instantiate()
		_card_factory(tech, "Tech")
		add_child(tech)
	for i in range(max_planets):
		var planet: Node2D = card_scene.instantiate()
		_card_factory(planet, "Planet")
		add_child(planet)
	
func _process(delta) -> void:
	pass

func _card_factory(inputObj: card, type: String):
	match(type):
		"Planet":                                                                                                                                                               
			inputObj.card_type = card.CardType.PLANET
			var random_pick = rng.randi_range(0, planets.size() - 1)
			var planet_picked = planets[random_pick]
			while planet_picked in planets_used:
				random_pick = rng.randi_range(0, planets.size() - 1)
				planet_picked = planets[random_pick]
			planets_used.append(planet_picked)
			inputObj.planet_name = planet_picked[0]
			inputObj.planet_energy = planet_picked[1]
			inputObj.planet_biomatter = planet_picked[2]
			inputObj.planet_exotic_materials = planet_picked[3]
		"Tech":
			inputObj.card_type = card.CardType.TECHNOLOGY
			var random_pick = rng.randi_range(0, techs.size() - 1)
			var tech_picked = techs[random_pick]
			while tech_picked in techs_used:
				random_pick = rng.randi_range(0, techs.size() - 1)
				tech_picked = techs[random_pick]
			techs_used.append(tech_picked)
			inputObj.tech_buff = tech_picked[1]
	
	
