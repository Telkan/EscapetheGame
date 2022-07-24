extends KinematicBody2D

var canMove := true
var moveSpeed := 18000
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
		$Jump.play()
	elif(is_on_floor()):
		jumpTime = 0.5
	elif(Input.is_action_just_released("ui_up") and jumpTime<0.3):
		jumpTime = 0.3
		

func _physics_process(delta):
	if canMove:
		movement = getMovement(delta)
		getJumpButton()
		if(not is_on_floor()):
			movement += calcVSpeed(delta)
		move_and_slide(movement,Vector2.UP)


func respawn():
	var newSpawnPoint = Vector2(184,768)
	var spawnPoints = get_tree().get_nodes_in_group("SpawnPoints")
	for spawnPoint in spawnPoints:
		if spawnPoint.global_position.x > global_position.x:
			continue
		if spawnPoint.global_position.distance_to(global_position) < newSpawnPoint.distance_to(global_position):
			newSpawnPoint = spawnPoint.global_position
		
	global_position = newSpawnPoint

func _on_Bean1_animation_finished():
	respawn()
	find_node("RespawnAnim").play("Respawn")


func _on_Bean2_animation_finished():
	respawn()
	pass # Replace with function body.


func _on_Bean3_animation_finished():
	respawn()
	pass # Replace with function body.


func _on_Bean4_animation_finished():
	respawn()
	pass # Replace with function body.


func _on_Bean5_animation_finished():
	respawn()
	pass # Replace with function body.
