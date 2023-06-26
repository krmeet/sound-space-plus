extends SpinBox

func _on_Scale_value_changed(value):
	var resolution = OS.window_size * value
	SSP.render_scale = value
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_IGNORE, resolution)

func viewport_size_changed():
	var resolution = OS.window_size * SSP.render_scale
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_IGNORE, resolution)
	
func _ready():
	 get_tree().get_root().connect("size_changed", self, "viewport_size_changed")
	 connect("changed", self, "_on_Scale_value_changed")
	 value = SSP.render_scale
