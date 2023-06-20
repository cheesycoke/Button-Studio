extends SpinBox

var slider = null

func _ready():
	if get_parent() is Slider:
		slider = get_parent()
		slider.connect("value_changed",self,"sliderchanged")
		step = slider.step
		min_value = slider.min_value
		max_value = slider.max_value
		value = slider.value

func sliderchanged(value):
	self.value = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_manual_value_changed(value):
	if slider:
		slider.value = value
