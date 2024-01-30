extends Node2D

var patterns_dict = {
	"circle": ['res://Textures/StarWarsMiniGame/Patterns/CirclePattern.png', 'res://StarWarsPatternPoints/CirclePatternPoints.tres', 'res://Textures/StarWarsMiniGame/Patterns/BrokeCirclePattern.png'],
	"star": ['res://Textures/StarWarsMiniGame/Patterns/StarPattern.png', 'res://StarWarsPatternPoints/StarPatternPoints.tres', 'res://Textures/StarWarsMiniGame/Patterns/BrokeStarPattern.png'],
	"stair": ['res://Textures/StarWarsMiniGame/Patterns/StairPattern.png', 'res://StarWarsPatternPoints/StairPatternPoints.tres', 'res://Textures/StarWarsMiniGame/Patterns/BrokeStairPattern.png'],
	"pentagon": ['res://Textures/StarWarsMiniGame/Patterns/PentagonPattern.png', 'res://StarWarsPatternPoints/PentagonPatternPoints.tres', 'res://Textures/StarWarsMiniGame/Patterns/BrokePentagonPattern.png']
}


var player_win : bool = false
var minigame_started : bool = false
var difficulty_scale : int
var has_been_called = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GAMEMNGR.star_wars += 1
	GAMEMNGR.currentMG = "star_wars"
	difficulty_scale = GAMEMNGR.star_wars
	
	if difficulty_scale >= 5:
		difficulty_scale = 4
	$Timer.wait_time = 9 - difficulty_scale
	
	var patterns = patterns_dict.keys()
	randomize()
	var random_pattern_key = patterns[randi() % patterns.size()]
	var random_pattern_values = patterns_dict.get(random_pattern_key)
	var background = random_pattern_values[0]
	var pattern_points = random_pattern_values[1]
	var broke_background = random_pattern_values[2]
	$Background.texture = load(background)
	$CanvasLayer/Path2DSlider/Path2D.curve = load(pattern_points)
	$BrokeBackground.texture = load(broke_background)
	
	if GAMEMNGR.star_wars == 1:
		$CanvasLayer/Path2DSlider.set_visible(false)
		$CanvasLayer/InstructionsUi.set_visible(false)
		$CanvasLayer/TimerLabel.set_visible(false)
		$CanvasLayer/TimerUi.set_visible(false)
		$CanvasLayer/InstructionsLabel.set_visible(true)
		
		$AnimationPlayer.play("start_anim")
		await get_tree().create_timer(2).timeout
	else:
		$CanvasLayer/InstructionsLabel.set_visible(false)
		$CanvasLayer/TimerLabel.text = str($Timer.wait_time)
		await get_tree().create_timer(1).timeout
	
	minigame_started = true
	$CanvasLayer/Path2DSlider.set_visible(true)
	$CanvasLayer/InstructionsUi.set_visible(true)
	$CanvasLayer/TimerLabel.set_visible(true)
	$CanvasLayer/TimerUi.set_visible(true)
	$CanvasLayer/InstructionsLabel.set_visible(false)
	
	
	
	$Timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	check_win()
	
	if minigame_started:
		$CanvasLayer/TimerLabel.text = str(ceil($Timer.time_left))
	
	
	if not has_been_called:
		if player_win:
			has_been_called = true
			$CanvasLayer/Path2DSlider.set_visible(false)
			var win_anims = ['win_anim1', 'win_anim2']
			$AnimationPlayer.play(win_anims[randi() % win_anims.size()])
			await get_tree().create_timer(3).timeout
			#Play anim here
			#player_win = false
			GAMEMNGR.score += 1
			print("player just won")
			FADE_EFFECT.scene_transition('res://Scenes/TransitionNode.tscn')
		

func check_win():
	if $CanvasLayer/Path2DSlider.progress_ratio > 0.97:
		player_win = true
		minigame_started = false
		$Timer.stop()


func _on_timer_timeout():
	#LOSE
	print("YOU LOSE")
	$CanvasLayer/Path2DSlider.set_visible(false)
	$AnimationPlayer.play("lose_anim")
	await get_tree().create_timer(4).timeout
	FADE_EFFECT.scene_transition('res://Scenes/MainMenu.tscn')
	
	
