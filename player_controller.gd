# Global script
extends Node

var connected_control_interface: ControlInterfaceComponent



func _ready() -> void:
	await get_tree().process_frame
	
	for scene_element in get_tree().current_scene.find_children("*"):
		if scene_element.is_in_group(ControlInterfaceComponent.GROUP_NAME):
			scene_element.input_pickable= true
			scene_element.input_event.connect(picked_controllable_entity.bind(scene_element))


func picked_controllable_entity(viewport: Node, event: InputEvent, shape_idx: int, scene_element: Node):
	if event is InputEventMouseButton and event.pressed:
		connect_to_entity(scene_element)


func connect_to_entity(entity: Node):
	var interface= entity.get_node_or_null(ControlInterfaceComponent.NODE_NAME)
	connected_control_interface= interface
	if connected_control_interface:
		prints("Connected to Entity", entity.name)
	

func _physics_process(delta: float):
	if connected_control_interface:
		connected_control_interface.external_physics_update(delta)
