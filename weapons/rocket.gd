extends WeaponInstance

@onready var area: Area2D = $Area2D


func _ready():
	set_physics_process(false)


func fire():
	reparent(get_tree().current_scene)
	set_physics_process(true)
	area.monitoring= true


func _physics_process(delta: float):
	global_position+= global_transform.x * 500 * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group(HealthComponent.GROUP_NAME):
		var health_component= body.get_node(HealthComponent.NODE_NAME)
		health_component.take_damage(100)
		queue_free()
