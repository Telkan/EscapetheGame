extends KinematicBody2D

export var canMove := true
var moveSpeed := 18000

var movement := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func getMovement(delta) -> Vector2:
	var direction := Vector2.ZERO
	
	if(Input.is_action_pressed("ui_left")):
		if($Footsteps.playing == false):
			$Footsteps.play()
		$Sprite.animation = "Walking"
		$Sprite.play()
		$Sprite.flip_h = true
		direction += Vector2.LEFT
	if(Input.is_action_pressed("ui_right")):
		if($Footsteps.playing == false):
			$Footsteps.play()
		$Sprite.animation = "Walking"
		$Sprite.play()
		$Sprite.flip_h = false
		direction += Vector2.RIGHT
	if direction == Vector2.ZERO:
		$Sprite.animation = "Idling"
		$Sprite.frame = 0
		$Footsteps.stop()
	return direction * moveSpeed * delta




func _physics_process(delta):
	if canMove:
		movement = getMovement(delta)
		move_and_slide(movement,Vector2.UP)
	if $Sprite.flip_h == true:
		$LG.set_visible(true)
		$LD.set_visible(false)
	else:
		$LD.set_visible(true)
		$LG.set_visible(false)
