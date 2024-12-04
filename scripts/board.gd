extends Node
## This class sets up the board for success

@export var total_cards: int

var rng = RandomNumberGenerator.new()
var card_scene: PackedScene
var planets: Array
var planets_on_board: Array
var techs: Array
var techs_on_board: Array
var unforeseens: Array
var unforeseens_on_board: Array
var specials: Array
var specials_dealt: Array

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
	unforeseens = [["Ananke", card.UnforeseenType.PLUS_ONE_E],
					["Asteria", card.UnforeseenType.NO_M],
					["Achlys", card.UnforeseenType.DRAW_NEW_SYSTEM],
					["Hebe", card.UnforeseenType.MINUS_TWO_E],
					["Iris", card.UnforeseenType.E_IS_X_AND_MINUS_TWO_X],
					["Hecate", card.UnforeseenType.NOTHING_HERE],
					["Tyche", card.UnforeseenType.DRAW_TWO_NEW_UF],
					["Eileithyia", card.UnforeseenType.MINUS_ONE_M],
					["Nemesis", card.UnforeseenType.MINUS_ONE_X],
					["Phobos", card.UnforeseenType.NO_E],
					["Deimos", card.UnforeseenType.PLUS_THREE_E_AND_MINUS_ONE_X],
					["Erebus", card.UnforeseenType.X_IS_M],
					["Nyx", card.UnforeseenType.MINUS_THREE_E_AND_PLUS_ONE_X],
					["Thanatos", card.UnforeseenType.NO_X],
					["Hypnos", card.UnforeseenType.PLUS_ONE_M],
					["Oneiroi", card.UnforeseenType.PLUS_TWO_M],
					["Moros", card.UnforeseenType.M_IS_E],
					["Keres", card.UnforeseenType.MINUS_TWO_M],
					["Eirene", card.UnforeseenType.PLUS_TWO_E],
					["Harmonia", card.UnforeseenType.PLUS_ONE_X],
					["Melinoe", card.UnforeseenType.MINUS_ONE_E],
					["Terminus", card.UnforeseenType.NOTHING_HERE],
					["Ascelpius", card.UnforeseenType.NO_M],
					["Janus", card.UnforeseenType.NO_E]]
	specials = [["Starlord", card.SpecialBuff.PLUS_FOR_E],
				["Technotopia", card.SpecialBuff.PLUS_FOR_TECH],
				["Exophile", card.SpecialBuff.PLUS_FOR_MOST_EXO],
				["Meson Collector", card.SpecialBuff.PLUS_FOR_X],
				["Empire", card.SpecialBuff.PLUS_FOR_P],
				["Landlord", card.SpecialBuff.PLUS_FOR_MOST_M],
				["Energy Monopoly", card.SpecialBuff.PLUS_FOR_MOST_ENERGY],
				["Mass Attractor", card.SpecialBuff.PLUS_FOR_M]]
	_build_board()
	
func _process(delta) -> void:
	pass
	

func _build_board():
	for i in range(techs.size()):
		var tech: Node2D = card_scene.instantiate()
		_card_factory(tech, "Tech")
		add_child(tech)
		tech.global_position = $TechDeckMarker.global_position + Vector2(0, techs_on_board.size() + (i * 10))
	for i in range(planets.size()):
		var planet: Node2D = card_scene.instantiate()
		_card_factory(planet, "Planet")
		add_child(planet)
		planet.global_position = $PlanetDeckMarker.global_position + Vector2(0, planets_on_board.size() + (i * 10))
	for i in range(unforeseens.size()):
		var uf: Node2D = card_scene.instantiate()
		_card_factory(uf, "Unforeseen")
		add_child(uf)
		uf.global_position = $UnforeseenDeckMarker.global_position + Vector2(0, unforeseens_on_board.size() + (i * 10))

func _card_factory(inputObj: card, type: String):
	inputObj.face_down = true
	match(type):
		"Planet":                                                                                                                                                               
			inputObj.card_type = card.CardType.PLANET
			var random_pick = rng.randi_range(0, planets.size() - 1)
			var planet_picked = planets[random_pick]
			while planet_picked in planets_on_board:
				random_pick = rng.randi_range(0, planets.size() - 1)
				planet_picked = planets[random_pick]
			planets_on_board.append(planet_picked)
			inputObj.back_of_card = inputObj.get_node("CardPlanet")
			inputObj.card_name = planet_picked[0]
			inputObj.planet_energy = planet_picked[1]
			inputObj.planet_biomatter = planet_picked[2]
			inputObj.planet_exotic_materials = planet_picked[3]
		"Tech":
			inputObj.card_type = card.CardType.TECHNOLOGY
			var random_pick = rng.randi_range(0, techs.size() - 1)
			var tech_picked = techs[random_pick]
			while tech_picked in techs_on_board:
				random_pick = rng.randi_range(0, techs.size() - 1)
				tech_picked = techs[random_pick]
			techs_on_board.append(tech_picked)
			inputObj.back_of_card = inputObj.get_node("CardTech")
			inputObj.card_name = tech_picked[0]
			inputObj.tech_buff = tech_picked[1]
		"Unforeseen":
			inputObj.card_type = card.CardType.UNFORESEEN
			var random_pick = rng.randi_range(0, unforeseens.size() - 1)
			var uf_picked = unforeseens[random_pick]
			while uf_picked in unforeseens_on_board:
				random_pick = rng.randi_range(0, unforeseens.size() - 1)
				uf_picked = unforeseens[random_pick]
			unforeseens_on_board.append(uf_picked)
			inputObj.back_of_card = inputObj.get_node("CardUf")
			inputObj.card_name = uf_picked[0]
			inputObj.unforeseen_type = uf_picked[1]
	
	
