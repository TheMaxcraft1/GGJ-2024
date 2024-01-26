extends Node2D

var player_win : bool
var minigame_started : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Rock.play('start_anim')
	$AnimationPlayer.play('start_anim')
	$HUD/TimerLabel.set_visible(false)
	await get_tree().create_timer(1).timeout
	$HUD/TimerLabel.set_visible(true)
	minigame_started = true
	$Rock.play("default")
	var time = $MGTimer.wait_time
	$MGTimer.start()
	$AnimationPlayer.speed_scale = 1 / time # dividing 1 which is the animation lenght by the timer's wait time
	$AnimationPlayer.play("ball_ind_jones_escaping_anim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkLose()
	
	if minigame_started:
		$ProgressBar.value += -(delta * 50)
	
		if Input.is_action_just_pressed("Interact"):
			$ProgressBar.value += (delta * 500)
	
	$HUD/TimerLabel.text = str(ceil($MGTimer.time_left)) + " sec"
	
	if minigame_started:
		if $ProgressBar.value > (100/3)*2:
			$IndJonesPlayer.texture = preload("res://Textures/IndianaJonesMiniGame/IndianaJonesSpriteSheet (1).png")
		elif $ProgressBar.value <= (100/3)*2 and $ProgressBar.value > 100/3:
			$IndJonesPlayer.texture = preload("res://Textures/IndianaJonesMiniGame/IndianaJonesSpriteSheet (3).png")
		else:
			$IndJonesPlayer.texture = preload("res://Textures/IndianaJonesMiniGame/IndianaJonesSpriteSheet (4).png")
	
	
	if player_win == true: # go into a transition
		player_win = false
		minigame_started = false
		$Rock.play("start_anim")
		$AnimationPlayer.speed_scale = 1
		$AnimationPlayer.play("end_anim1")
		GAMEMNGR.score += 1
		GAMEMNGR.ind_jones += 1
		await get_tree().create_timer(5).timeout
		FADE_EFFECT.scene_transition("res://Scenes/TransitionNode.tscn")
	

func checkLose():
	if $ProgressBar.value == 0:
		minigame_started = false
		$HUD/TimerLabel.set_visible(false)
		$MGTimer.stop()
		player_win = false
		$AnimationPlayer.pause()


func _on_mg_timer_timeout():
	if not $ProgressBar.value == 0:
		player_win = true
