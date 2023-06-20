extends Viewport

onready var export_folder = $"../../ExportFolder"
onready var control = $Control
onready var theZone = $"../.."


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
#	size = Vector2($"../../Size".value,$"../../Size".value)
#	var dir = Directory.new()
#	dir.open("user://")
#	dir.make_dir("exports/")

	export_folder.popup()
	export_folder.current_dir = ProjectSettings.globalize_path("user://")
#	size = Vector2(320,320)

func _on_ExportFolder_file_selected(path):
	pass

func _on_ExportFolder_dir_selected(dir):
	$Control/Label.rect_scale = Vector2(1,1)
	$Control/Label.rect_pivot_offset = $Control/Label.rect_size/2
	$Control/Label.text = "A"
	var savedir = Directory.new()
	savedir.open(dir)
	theZone.optToggle(true)
	yield(get_tree(), "idle_frame")
	if $"../../ExportList/keyboard".pressed == true:
		savedir.make_dir("Keyboard/")
		for i in BTNDATA.alphabet:
	#		$Control/Label.text = i
	#		if $Control/Label.text.length() > 1:
	#			$Control/Label.rect_scale = Vector2(0.75,0.75)
	#		else:
	#			$Control/Label.rect_scale = Vector2(1,1)
	#		yield(get_tree(), "idle_frame")
			GenerateButton(i,"alphabet")
			yield(self,"buttoncomplete")
			var img = get_texture().get_data()
			img.flip_y()
			img.save_png(dir+"/Keyboard/"+i+".png")
		
		
		for i in BTNDATA.special:
			GenerateButton(i,"special")
			yield(self,"buttoncomplete")
			var img = get_texture().get_data()
			img.flip_y()
			img.save_png(dir+"/Keyboard/"+i+".png")

		savedir.make_dir("Keyboard/")
		for i in BTNDATA.odd:
			GenerateButton(i,"odd")
			yield(self,"buttoncomplete")
			var img = get_texture().get_data()
			img.flip_y()
			img.save_png(dir+"/Keyboard/"+i+".png")
	
	if $"../../ExportList/gamepad".pressed == true:
		for i in BTNDATA.gamepadtxt:
			savedir.make_dir("Joypad/")
			savedir.make_dir("Joypad/"+BTNDATA.gamepadtxt[i].sys)
			GenerateButton(i,"gamepadtxt")
			yield(self,"buttoncomplete")
			var img = get_texture().get_data()
			img.flip_y()
			img.save_png(dir+"/Joypad/"+(BTNDATA.gamepadtxt[i].sys)+"/"+(BTNDATA.gamepadtxt[i].file)+".png")
	if $"../../ExportList/gamepad2".pressed == true:
		for i in BTNDATA.gpodd:
			savedir.make_dir("Joypad/")
			savedir.make_dir("Joypad/"+BTNDATA.gpodd[i].sys)
			GenerateButton(i,"gpodd")
			yield(self,"buttoncomplete")
			var img = get_texture().get_data()
			img.flip_y()
			img.save_png(dir+"/Joypad/"+(BTNDATA.gpodd[i].sys)+"/"+(BTNDATA.gpodd[i].file)+".png")
	
	if $"../../ExportList/open".pressed == true:
		OS.shell_open(ProjectSettings.globalize_path(dir))
	$"../../PreviewSelect".select(0)
	GenerateButton("M","alphabet")
	theZone.optToggle(false)

signal buttoncomplete()

func GenerateButton(input,type):
	if type == "alphabet":
		$Control/Label.align = Label.ALIGN_CENTER
		$Control/Label.text = input
	else:
		$Control/Label.align = Label.ALIGN_LEFT
		$Control/Label.text = BTNDATA.get(type)[input].txt
	if type == "odd" or type == "gpodd":
		control.sizemult = BTNDATA.get(type)[input].ratio
	else:
		control.sizemult = Vector2(1,1)
	if type == "gamepadtxt" or type == "gamepadicon":
		control.gpmode(true)
	elif type == "gpodd":
		if BTNDATA.get(type)[input].rnd == true:
			control.gpmode(true)
		else:
			control.gpmode(false)
	else:
		control.gpmode(false)
	
	yield(get_tree(), "idle_frame")
	control.drawFont()
	$Control/Label.rect_pivot_offset = $Control/Label.rect_size/2
	if $Control/Label.text.length() > 1:
		if type != "alphabet" and type != "gpodd":
			$Control/Label.rect_scale = Vector2(0.5,0.5)
		else:
			$Control/Label.rect_scale = Vector2(0.75,0.75)
	else:
		$Control/Label.rect_scale = Vector2(1,1)
	yield(get_tree(), "idle_frame")
	control.drawFont()
	emit_signal("buttoncomplete")
	

func _on_PreviewSelect_item_selected(index):
	match index:
		0:
			GenerateButton("M","alphabet")
		1:
			GenerateButton("PrintScrn","special")
		2:
			GenerateButton("Backspace","odd")
		3:
			GenerateButton("NumEnter","odd")
		4:
			GenerateButton("Axbx","gamepadtxt")
