extends RigidBody2D

@export var acceleration= 10000
@export var rotation_speed= 10000

@onready var polygon: Polygon2D = $Polygon2D
@onready var death_particles: CPUParticles2D = $"Death Particles"
@onready var weapon_controller: WeaponController = $"Weapon Controller"


func external_physics_update(delta):
	apply_central_force(global_transform.x * Input.get_action_strength("ui_up") * acceleration * delta)
	
	var rot= Input.get_axis("ui_left", "ui_right")
	apply_torque(rot * rotation_speed * delta)


func on_death():
	polygon.hide()
	weapon_controller.queue_free()
	
	death_particles.emitting= true
	await get_tree().create_timer(0.5).timeout
	queue_free()
