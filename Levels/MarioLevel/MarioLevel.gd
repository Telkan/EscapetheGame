extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var glitch := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if glitch:
		$bgMusic.playing = not $bgMusic.playing
	pass


func stopCrash():
	glitch = false

func _on_Beans_crashGame():
	glitch = true
	$CanvasLayer/CrashDisplay.play("Crash")
	pass # Replace with function body.

func changeWorld():
	print("badidon ça change quand même")
	pass
