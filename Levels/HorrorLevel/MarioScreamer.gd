extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var run := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(run):
		global_position.x -= 1300*delta
	pass

func startRunning():
	set_visible(true)
	run = true


func _on_Area2D_area_entered(area):
	run = false
	$Crash.play()
	get_parent().find_node("ToEnd").start()
	pass # Replace with function body.
