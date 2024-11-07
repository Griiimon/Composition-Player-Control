class_name ControlInterfaceComponent
extends Node

const NODE_NAME= "Control Interface"
const GROUP_NAME= "Controllable"

@export var weapon_controller: WeaponController



func _ready() -> void:
	assert(get_parent().has_method("external_physics_update"))
	get_parent().add_to_group(GROUP_NAME)


func external_physics_update(delta: float):
	if weapon_controller:
		if Input.is_action_just_pressed("ui_select"):
			weapon_controller.fire_weapon()
			
	get_parent().external_physics_update(delta)
