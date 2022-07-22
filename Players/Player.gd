extends KinematicBody2D

var canMove := true
var moveSpeed := 15000
export(Curve) var jumpCurve
var jumpTime = 0.5
var jumpSpeed = 1
var jumpHeight = 200
var movement := Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func getMovement(delta) -> Vector2:
	var direction := Vector2.ZERO
	if(Input.is_action_pressed("ui_left")):
		direction += Vector2.LEFT
	if(Input.is_action_pressed("ui_right")):
		direction += Vector2.RIGHT
	return direction * moveSpeed * delta

func calcVSpeed(delta) -> Vector2:		
	if(jumpTime < 1):
		jumpTime+=jumpSpeed*delta
	if(is_on_ceiling()):
		jumpTime = 0.5
	var verticalSpeed = jumpCurve.interpolate(jumpTime)
	return Vector2(0,-(verticalSpeed * jumpHeight))

func getJumpButton():
	if(is_on_floor() and Input.is_action_pressed("ui_up")):
		jumpTime = 0
	elif(is_on_floor()):
		jumpTime = 0.5
	elif(Input.is_action_just_released("ui_up") and jumpTime<0.3):
		jumpTime = 0.3
		

func _physics_process(delta):
	if canMove:
		var movement = getMovement(delta)
		getJumpButton()
		if(not is_on_floor()):
			movement += calcVSpeed(delta)
		move_and_slide(movement,Vector2.UP)
