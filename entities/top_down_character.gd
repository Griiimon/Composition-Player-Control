class_name TopDownCharacter
extends CharacterBody2D

@export var move_speed= 100.0
@export var rotation_speed= 3.0


func external_physics_update(delta: float):
	var rotation= Input.get_axis("ui_left", "ui_right") 
	var move= Input.get_axis("ui_down", "ui_up") 

	rotate(rotation * rotation_speed * delta)
	move_and_collide(global_transform.x * move * move_speed * delta)
