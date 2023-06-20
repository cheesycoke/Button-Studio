extends Control

const basesize = Vector2(80,80)
var size = Vector2(80,80)
var sizemult = Vector2(1,1)
var rounded = 0
var stroke = 0
var tiltH = 0
var tiltV = 0
var shadowDist = 0
var shadowDistX = 0

var fontsize = 48
var spacingH = -4
var spacingV = -24
var curfont = "res://OpenSans-ExtraBold.ttf"

var bgcolor = Color(0,0,0,1)
var strokecolor = Color(1,1,1,1)
var shadowcolor = Color(0,0,0,0)
var textcolor = Color(1,1,1,1)

var strokeblur = false
var roundsmooth = true
var gpround = true
var override = false

onready var label = $Label

func _ready():
	update()

func _draw():
	var style_box = StyleBoxFlat.new()
	style_box.anti_aliasing_size = 1
	
#	Colors
	style_box.bg_color=bgcolor
	style_box.border_color=strokecolor
	style_box.shadow_color=shadowcolor
	label.modulate = textcolor
	$Sprite.modulate = textcolor
	
#	Rounded and Stroke
	if override == true and gpround == true:
		style_box.corner_detail = 8
		style_box.set_corner_radius_all(100)
	else:
		style_box.set_corner_radius_all(rounded)
		if roundsmooth == true:
			style_box.corner_detail = 8
		else:
			style_box.corner_detail = 0
	
	style_box.set_border_width_all(stroke)
	style_box.border_blend = strokeblur
#	style_box.corner_detail = 0
	
#	Tilt
	style_box.skew = Vector2(tiltH,tiltV)
	
#	Shadow
	style_box.shadow_offset = Vector2(shadowDistX,shadowDist)
	style_box.shadow_size = 1
	
	draw_style_box(style_box, Rect2(Vector2(-size.x/2*sizemult.x,-size.y/2*sizemult.y),Vector2(size.x*sizemult.x,size.y*sizemult.y)))
#	draw_rect(Rect2(Vector2(-size/2,-size/2),Vector2(size,size)),Color.red,true)
	

func _on_Round_value_changed(value):
	rounded = value
#	$"../../../Round/manual".text = str(value)
	update()

func _on_Stroke_value_changed(value):
	stroke = value
	update()

func _on_BGPicker_color_changed(color):
	bgcolor = color
	update()

func _on_StrokePicker_color_changed(color):
	strokecolor = color
	update()

func _on_ShadowPicker_color_changed(color):
	shadowcolor = color
	update()

func _on_TextPicker_color_changed(color):
	textcolor = color
	update()

func _on_Tilt_value_changed(value):
	tiltH = value
	update()

func _on_TiltV_value_changed(value):
	tiltV = value
	update()

func _on_ShadowDist_value_changed(value):
	shadowDistX = value
	update()

func _on_LoadFont_pressed():
	$"../../../FontLoader".popup()

func _on_FontLoader_file_selected(path):
	curfont = path
	drawFont()

func _on_ResetFont_pressed():
	curfont = "res://OpenSans-ExtraBold.ttf"
	drawFont()

func _on_blur_toggled(button_pressed):
	strokeblur = button_pressed
	update()

func _on_smooth_toggled(button_pressed):
	roundsmooth = button_pressed
	update()

func _on_SpinBox_value_changed(value):
	fontsize = value
	drawFont()

func drawFont():
	var newfont = DynamicFont.new()
	newfont.size = fontsize
	newfont.extra_spacing_char = spacingH
	newfont.font_data = load(curfont)
	label.add_constant_override("line_spacing",spacingV)
	$Label.add_font_override("font",newfont)
	label.rect_pivot_offset = label.rect_size/2

func _on_HSpace_value_changed(value):
	spacingH = value
	drawFont()

func _on_VSpace_value_changed(value):
	spacingV = value
	drawFont()


func _on_ShadowDistY_value_changed(value):
	shadowDist = value
	update()

func gpmode(isit):
	override = isit
	update()

func loadstyle():
	pass

func _on_gamepadsmooth_toggled(button_pressed):
	gpround = button_pressed
	update()
