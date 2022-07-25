extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var beanToKill = 0
var listOfBeans

signal crashGame()
# Called when the node enters the scene tree for the first time.
func _ready():
	listOfBeans = [$Bean1,$Bean2,$Bean3,$Bean4,$Bean5]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_FallingOffScreen_body_entered(body):
	if beanToKill>=5:
		emit_signal("crashGame")
		return
	listOfBeans[beanToKill].frame =1
	listOfBeans[beanToKill].play()
	beanToKill+=1
	$BeanCrunchSound.play()
	pass # Replace with function body.


func _on_BeanCollectible_displayBeans():
	set_visible(true)
	pass # Replace with function body.
