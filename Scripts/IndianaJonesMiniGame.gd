extends Node2D

var player_win : bool
var minigame_started : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	GAMEMNGR.currentMG = "indiana_jones"
	
	$ProgressBar.set_visible(false)
	$EightbitMusic.volume_db = 0
	$FluteMusic.volume_db = -80 # Muted
	$HUD/TimerLabel.set_visible(false)
	$AnimationPlayer.play("instructions_anim")
	await get_tree().create_timer(7).timeout
	$HUD/InstructionsLabel.set_visible(false)
	
	
	$Rock.play('start_anim')
	$AnimationPlayer.play('start_anim')
	await get_tree().create_timer(1).timeout
	$ProgressBar.set_visible(true)
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
		$ProgressBar.value += -(delta * 50) # Progress bar counter force
	
		if Input.is_action_just_pressed("Interact"):
			$ProgressBar.value += (delta * 500)
			
		if $ProgressBar.value > (100/3)*2:
			$EightbitMusic.volume_db = 0
			$FluteMusic.volume_db = -80
			$IndJonesPlayer.texture = preload("res://Textures/IndianaJonesMiniGame/IndianaJonesSpriteSheet (1).png")
		elif $ProgressBar.value <= (100/3)*2 and $ProgressBar.value > 100/3:
			$EightbitMusic.volume_db = -80
			$FluteMusic.volume_db = 0
			$IndJonesPlayer.texture = preload("res://Textures/IndianaJonesMiniGame/IndianaJonesSpriteSheet (3).png")
		else:
			$EightbitMusic.volume_db = -80
			$FluteMusic.volume_db = 0
			$IndJonesPlayer.texture = preload("res://Textures/IndianaJonesMiniGame/IndianaJonesSpriteSheet (4).png")
	
	$HUD/TimerLabel.text = str(ceil($MGTimer.time_left)) + " sec"	
	
	if player_win == true: # go into a transition
		$FluteMusic.volume_db = -80
		$EightbitMusic.volume_db = 0
		player_win = false
		minigame_started = false
		$HUD/TimerLabel.set_visible(false)
		$Rock.play("start_anim")
		$AnimationPlayer.speed_scale = 1
		$AnimationPlayer.play("end_anim1")
		GAMEMNGR.score += 1
		GAMEMNGR.ind_jones += 1
		await get_tree().create_timer(1).timeout
		FADE_EFFECT.scene_transition("res://Scenes/TransitionNode.tscn")
	

func checkLose():
	if minigame_started:
		if $ProgressBar.value == 0:
			minigame_started = false
			$FluteMusic.volume_db = 0
			$EightbitMusic.volume_db = -80
			minigame_started = false
			$HUD/TimerLabel.set_visible(false)
			$MGTimer.stop()
			player_win = false
			$Rock.play('start_anim')
			$AnimationPlayer.pause()
			$IndJonesPlayer.texture = preload("res://Textures/IndianaJonesMiniGame/IndianaJonesSpriteSheet 6.png")
			
			await get_tree().create_timer(1.5).timeout
			FADE_EFFECT.scene_transition('res://Scenes/MainMenu.tscn')


func _on_mg_timer_timeout():
	if not $ProgressBar.value == 0:
		player_win = true
