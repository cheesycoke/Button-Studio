extends Control

func _ready():
	update()

func _draw():
	draw_line(Vector2.ZERO,Vector2(20,20),Color(1,0,0),8)
#	i put this in here to initially test drawing. i'd like to keep it :3

#func saveFile(filepath):
#	SimpleSave.save_scene(get_tree(),filepath)
#	pass
#
#func loadFile(filepath):
#	pass

func optToggle(onoff):
	for i in get_children():
		if "disabled" in i:
			i.disabled = onoff
		elif "editable" in i:
			i.editable = !onoff
		for ii in i.get_children():
			if "disabled" in ii:
				ii.disabled = onoff
			elif "editable" in ii:
				ii.editable = !onoff
			for iii in ii.get_children():
				if "disabled" in iii:
					iii.disabled = onoff
				elif "editable" in iii:
					iii.editable = !onoff
#				isn't this shit hilarious?
