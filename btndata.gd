extends Node

var alphabet = [
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	
	"F1",
	"F2",
	"F3",
	"F4",
	"F5",
	"F6",
	"F7",
	"F8",
	"F9",
	"F10",
	"F11",
	"F12",
]

var special = {
	"Delete":{"txt":"Del"},
	"Home":{"txt":"Home"},
	"Insert":{"txt":"Ins"},
	"PageDown":{"txt":"PgDn"},
	"PageUp":{"txt":"PgUp"},
	"Tilde":{"txt":"~"},
	"Question":{"txt":"?"},
	"Esc":{"txt":"Esc"},
	"Plus":{"txt":"+"},
	"Minus":{"txt":"-"},
	"Asterisk":{"txt":"*"},
	"Semicolon":{"txt":";"},
	"BracketLeft":{"txt":"["},
	"BracketRight":{"txt":"]"},
	"Slash":{"txt":"/"},
	"BackSlash":{"txt":"\\"},
	"Quote":{"txt":"\""},
	"End":{"txt":"End"},
	"LT":{"txt":"<"},
	"GT":{"txt":">"},
	"PrintScrn":{"txt":"Prt\nScrn"},
	"NumLock":{"txt":"Num\nLock"},
	"Ctrl":{"txt":"Ctrl"},
	"Alt":{"txt":"Alt"},
	"Blank":{"txt":""},
}

var odd = {
	"ButtonStudio":{"txt":"ButtStu","ratio":Vector2(1.25,0.8)},
	"Shift":{"txt":"Shift","ratio":Vector2(1.2,0.8)},
	"Enter":{"txt":"Enter","ratio":Vector2(1.2,0.8)},
	"Backspace":{"txt":"Back\nSpace","ratio":Vector2(1.2,0.8)},
	"Space":{"txt":"Space","ratio":Vector2(1.2,0.8)},
	"Tab":{"txt":"Tab","ratio":Vector2(1.2,0.8)},
	"CapsLock":{"txt":"Caps\nLock","ratio":Vector2(1.2,0.8)},
	"NumPlus":{"txt":"+","ratio":Vector2(0.8,1.2)},
	"NumEnter":{"txt":"Enter","ratio":Vector2(0.8,1.2)},
}

var gamepadtxt = {
	"Axbx":{"txt":"A","file":"A","sys":"Xbox"},
	"Xxbx":{"txt":"X","file":"X","sys":"Xbox"},
	"Bxbx":{"txt":"B","file":"B","sys":"Xbox"},
	"Yxbx":{"txt":"Y","file":"Y","sys":"Xbox"},
	
	"Anin":{"txt":"A","file":"A","sys":"Joy-Con"},
	"Xnin":{"txt":"X","file":"X","sys":"Joy-Con"},
	"Bnin":{"txt":"B","file":"B","sys":"Joy-Con"},
	"Ynin":{"txt":"Y","file":"Y","sys":"Joy-Con"},
	
	"Oouya":{"txt":"O","file":"O","sys":"Ouya"},
	"Uouya":{"txt":"U","file":"U","sys":"Ouya"},
	"Youya":{"txt":"Y","file":"Y","sys":"Ouya"},
	"Aouya":{"txt":"A","file":"A","sys":"Ouya"},
	
	"BlankBTN":{"txt":" ","file":"BlankFace","sys":"Template"},
}

var gpodd = {
	"Rnin":{"txt":"R","file":"RB","ratio":Vector2(1.2,0.8),"sys":"Joy-Con","rnd":false},
	"Lnin":{"txt":"L","file":"LB","ratio":Vector2(1.2,0.8),"sys":"Joy-Con","rnd":false},
	"RSnin":{"txt":"R","file":"RightStick","ratio":Vector2(1.4,1.4),"sys":"Joy-Con","rnd":true},
	"LSnin":{"txt":"L","file":"LeftStick","ratio":Vector2(1.4,1.4),"sys":"Joy-Con","rnd":true},
	"PLUSnin":{"txt":"+","file":"Start","ratio":Vector2(0.8,0.8),"sys":"Joy-Con","rnd":true},
	"MINnin":{"txt":"-","file":"Select","ratio":Vector2(0.8,0.8),"sys":"Joy-Con","rnd":true},
	
	"Rxbx":{"txt":"RB","file":"RB","ratio":Vector2(1.2,0.8),"sys":"Xbox","rnd":false},
	"Lxbx":{"txt":"LB","file":"LB","ratio":Vector2(1.2,0.8),"sys":"Xbox","rnd":false},
	"RSxbx":{"txt":"R","file":"RightStick","ratio":Vector2(1.4,1.4),"sys":"Xbox","rnd":true},
	"LSxbx":{"txt":"L","file":"LeftStick","ratio":Vector2(1.4,1.4),"sys":"Xbox","rnd":true},
	
	"Rps":{"txt":"R1","file":"RB","ratio":Vector2(1.2,0.8),"sys":"DualShock","rnd":false},
	"Lps":{"txt":"L1","file":"LB","ratio":Vector2(1.2,0.8),"sys":"DualShock","rnd":false},
	"RSps":{"txt":"R","file":"RightStick","ratio":Vector2(1.4,1.4),"sys":"DualShock","rnd":true},
	"LSps":{"txt":"L","file":"LeftStick","ratio":Vector2(1.4,1.4),"sys":"DualShock","rnd":true},
	
	"Rou":{"txt":"R","file":"RB","ratio":Vector2(1.2,0.8),"sys":"Ouya","rnd":false},
	"Lou":{"txt":"L","file":"LB","ratio":Vector2(1.2,0.8),"sys":"Ouya","rnd":false},
	"RSou":{"txt":"R","file":"RightStick","ratio":Vector2(1.4,1.4),"sys":"Ouya","rnd":true},
	"LSou":{"txt":"L","file":"LeftStick","ratio":Vector2(1.4,1.4),"sys":"Ouya","rnd":true},
	
	"WideBlankBTN":{"txt":"","file":"BlankShoulder","ratio":Vector2(1.2,0.8),"sys":"Template","rnd":false},
}

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
