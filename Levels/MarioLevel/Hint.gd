extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_visible(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	set_visible(true)
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	set_visible(false)
	pass # Replace with function body.
