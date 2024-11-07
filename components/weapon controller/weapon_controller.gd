class_name WeaponController
extends Node2D



func fire_weapon():
	for slot in get_children():
		if slot.weapon:
			slot.fire()
			return
