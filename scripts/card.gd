class_name card
extends Node2D

enum CardType
{
	PLANET,
	TECHNOLOGY,
	UNFORESEEN,
	SPECIAL	
}

enum TechBuff
{
	NEGATE_NO_ENERGY,
	NEGATE_NO_BIOMATTER,
	NEGATE_NO_EXOTIC,
	NEGATE_NEGATIVE_ENERGY,
	NEGATE_NEGATIVE_BIOMATTER,
	NEGATE_NEGATIVE_EXOTIC,
	IGNORE_NO,
	BANK_PAYS_RESEARCH,
	CONVERT_E2M,
	GAIN_3E,
	BANK_PAYS_EXPLORE,
	E_FOR_UF
}

enum SpecialBuff
{
	PLUS_FOR_E,
	PLUS_FOR_TECH,
	PLUS_FOR_MOST_EXO,
	PLUS_FOR_MOST_M,
	PLUS_FOR_MOST_ENERGY,
	PLUS_FOR_P,
	PLUS_FOR_X,
	PLUS_FOR_M
}

var card_type: CardType
var tech_buff: TechBuff
var special_buff: SpecialBuff
var planet_name: String
var planet_energy: int
var planet_biomatter: int
var planet_exotic_materials: int


# Called when the node enters the scene tree for the first time.
func _ready():
	match(card_type):
		CardType.PLANET:
			pass
		CardType.TECHNOLOGY:
			pass
		CardType.UNFORESEEN:
			pass
		CardType.SPECIAL:
			pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
