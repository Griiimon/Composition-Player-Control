class_name WeaponSlot
extends Node2D

@export var weapon: Weapon

var weapon_instance: WeaponInstance



func _ready():
	if weapon:
		weapon_instance= weapon.scene.instantiate()
		add_child(weapon_instance)


func fire():
	weapon_instance.fire()
	if weapon.one_shot:
		weapon= null
		weapon_instance= null
