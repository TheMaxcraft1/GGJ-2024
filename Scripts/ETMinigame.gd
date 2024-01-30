extends Node2D

var player_win : bool
var difficulty_scale : int
var has_been_called: bool = false
var has_game_started: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	GAMEMNGR.et += 1
	GAMEMNGR.currentMG = "et"
	difficulty_scale = GAMEMNGR.et
	$CanvasLayer/ETHand.set_visible(false)
	$CanvasLayer/ETHand.position = Vector2(-62, 379)
	$CanvasLayer/UI_Timer.set_visible(false)
	$CanvasLayer/UI_Instructions.set_visible(false)
	
	
	$GameTimer.wait_time = 7 - difficulty_scale
	if $GameTimer.wait_time < 3:
		$GameTimer.wait_time = 3
	
	if GAMEMNGR.et == 1:
		$AnimationPlayer.play("start_anim")
		await get_tree().create_timer(2).timeout
		
	$CanvasLayer/Label.set_visible(false)
	$CanvasLayer/ETHand.set_visible(true)
	$CanvasLayer/UI_Timer.set_visible(true)
	$CanvasLayer/UI_Instructions.set_visible(true)
		
	has_game_started = true
	$GameTimer.start()
	$CanvasLayer/ETHand.can_move = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	if has_game_started:
		$CanvasLayer/UI_Timer/TimerLabel.text = str(ceil($GameTimer.time_left))
	
	if not has_been_called:
		if player_win == true:
			has_been_called = true
			has_game_started = false
			$GameTimer.stop()
			GAMEMNGR.score += 1
			$CanvasLayer/ETHand.set_visible(false)
			$AnimationPlayer.play("win_anim")
			await get_tree().create_timer(5.1).timeout
			FADE_EFFECT.scene_transition('res://Scenes/TransitionNode.tscn')
	
	
	


func _on_phone_area_2d_area_entered(area):
	if area.get_name() == "HandArea2d":
		player_win = true
		print(player_win)
		


func _on_game_timer_timeout():
	$CanvasLayer/UI_Timer.set_visible(false)
	$CanvasLayer/ETHand.set_visible(false)
	$CanvasLayer/UI_Instructions.set_visible(false)
	
	$AnimationPlayer.play("lose_anim")
	await get_tree().create_timer(3).timeout
	FADE_EFFECT.scene_transition('res://Scenes/MainMenu.tscn')
