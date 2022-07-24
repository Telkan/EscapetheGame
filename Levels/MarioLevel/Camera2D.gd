extends Camera2D

var rng = RandomNumberGenerator.new()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shaking := false
var shakingEffort = 1
func _ready():
	rng.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shaking:
		offset = Vector2(rng.randf_range(-shakingEffort, shakingEffort),rng.randf_range(-shakingEffort, shakingEffort))
		shakingEffort+= 20*delta
	pass

func setShake(value):
	shaking = value
	shakingEffort = 1
	if value == false:
		offset = Vector2.ZERO
