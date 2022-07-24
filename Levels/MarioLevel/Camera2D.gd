extends Camera2D

var rng = RandomNumberGenerator.new()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shaking := false

func _ready():
	rng.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shaking:
		offset = Vector2(rng.randf_range(-10.0, 10.0),rng.randf_range(-10.0, 10.0))
	pass

func setShake(value):
	shaking = value
