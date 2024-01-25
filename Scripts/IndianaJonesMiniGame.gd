extends Node2D

var player_win : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	var time = $Timer.wait_time
	$AnimationPlayer.speed_scale = 1 / time # dividing 1 which is the animation lenght by the timer's wait time
	$AnimationPlayer.play("ball_ind_jones_escaping_anim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkLose()
	
	$ProgressBar.value += -(delta * 25)
	
	if Input.is_action_just_pressed("Interact"):
		$ProgressBar.value += (delta * 500)
	
	$HUD/TimerLabel.text = str(ceil($Timer.time_left)) + " sec"
	
	if player_win == true: # go into a transition
		GAMEMNGR.score += 1
		player_win = false
		GAMEMNGR.ind_jones += 1
		FADE_EFFECT.scene_transition("res://Scenes/TransitionNode.tscn")
	

func _on_timer_timeout():
	if not $ProgressBar.value == 0:
		player_win = true


func checkLose():
	if $ProgressBar.value == 0:
		player_win = false
