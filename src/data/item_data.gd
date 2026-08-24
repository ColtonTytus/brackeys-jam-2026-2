class_name ItemData
extends Resource

enum DAMAGETYPES {
	blunt,
	sharp,
	temp,
	electric,
	toxic,
	radiant,
	necrotic,
	arcane,
}

@export var id : int
@export var name : String
@export var value : int
@export var icon : Texture2D
@export var damage_blunt : float
@export var damage_sharp : float
@export var damage_temp : float #Negative value is cold, positive value is heat
@export var damage_electric : float
@export var damage_toxic : float
@export var damage_radiant : float
@export var damage_necrotic : float
@export var damage_arcane : float

@export var insulation_blunt : float
@export var insulation_sharp : float
@export var insulation_temp : Vector2 #X is cold, Y is heat
@export var insulation_toxic : float
@export var insulation_radiant : float
@export var insulation_necrotic : float
@export var insulation_arcane : float
