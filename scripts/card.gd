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

enum UnforeseenType
{
	PLUS_ONE_E,
	NO_M,
	DRAW_NEW_SYSTEM,
	MINUS_TWO_E,
	E_IS_X_AND_MINUS_TWO_X,
	NOTHING_HERE,
	DRAW_TWO_NEW_UF,
	MINUS_ONE_M,
	MINUS_ONE_X,
	NO_E,
	PLUS_THREE_E_AND_MINUS_ONE_X,
	X_IS_M,
	MINUS_THREE_E_AND_PLUS_ONE_X,
	NO_X,
	PLUS_ONE_M,
	PLUS_TWO_M,
	M_IS_E,
	MINUS_TWO_M,
	PLUS_TWO_E,
	PLUS_ONE_X,
	MINUS_ONE_E
	
}

var card_type: CardType
var tech_buff: TechBuff
var special_buff: SpecialBuff
var unforeseen_type: UnforeseenType
var card_name: String
var planet_energy: int
var planet_biomatter: int
var planet_exotic_materials: int
var face_down: bool
var back_of_card: Sprite2D

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
	if(back_of_card && back_of_card.visible == false && face_down):
		back_of_card.visible = true

func _physics_process(delta):
	pass
