class_name HealthComponent
extends Node

const NODE_NAME= "Health Component"
const GROUP_NAME= "Damagable"

@export var max_hitpoints= 10

var hitpoints



func _ready() -> void:
	hitpoints= max_hitpoints
	get_parent().add_to_group(GROUP_NAME)


func take_damage(dmg: int):
	hitpoints-= dmg
	if hitpoints <= 0:
		if get_parent().has_method("on_death"):
			get_parent().on_death()
		else:
			get_parent().queue_free()
