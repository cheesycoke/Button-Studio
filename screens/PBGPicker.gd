extends ColorPickerButton

onready var prevbg = $"../ColorRect"

func _ready():
	color = prevbg.color

func _on_PBGPicker_color_changed(color):
	prevbg.color = color
