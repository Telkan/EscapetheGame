extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isCollected :=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if(not isCollected):
		set_visible(false)
		$Collected.play()
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	queue_free()
	pass # Replace with function body.
