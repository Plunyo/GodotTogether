@tool
extends Node3D
class_name User3D

@onready var ui = $ui.duplicate()
@onready var text_ui = ui.get_node("txt")

var main:GodotTogether

func _ready():
	assert(main,"main not set")
	$ui.visible = false
	ui.visible = true
	EditorInterface.get_editor_viewport_3d().add_child(ui)
	
func _exit_tree():
	ui.queue_free()
	
func _process(delta):
	if not main: return
	var cam =  main.get_editor_3d_camera()
	var dist = cam.position.distance_to(position)
	ui.position = cam.unproject_position(position) - ui.size/2 - (Vector2(0,200)/dist)
