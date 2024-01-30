extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	if GAMEMNGR.currentMG == "indiana_jones":
		$Background.texture = preload('res://Textures/TransitionBackgrounds/IndJonesTransitionBG.png')
	elif GAMEMNGR.currentMG == 'star_wars':
		$Background.texture = preload('res://Textures/TransitionBackgrounds/StarWarsTransitionBG.png')
	elif GAMEMNGR.currentMG == "et":
		$Background.texture = preload('res://Textures/TransitionBackgrounds/ETTransitionBG.png')
	
	
	$ScoreLabel.text = "SCORE: " + str(GAMEMNGR.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_transition_time_timeout():
	if GAMEMNGR.currentMG == "indiana_jones":
		var scenes = ['res://Scenes/StarWarsMiniGame.tscn', 'res://Scenes/ETMinigame.tscn']
		FADE_EFFECT.scene_transition(scenes[randi() % scenes.size()])
	elif GAMEMNGR.currentMG == "star_wars":
		var scenes = ['res://Scenes/IndianaJonesMiniGame.tscn', 'res://Scenes/ETMinigame.tscn']
		FADE_EFFECT.scene_transition(scenes[randi() % scenes.size()])
	elif GAMEMNGR.currentMG == "et":
		var scenes = ['res://Scenes/IndianaJonesMiniGame.tscn', 'res://Scenes/StarWarsMiniGame.tscn']
		FADE_EFFECT.scene_transition(scenes[randi() % scenes.size()])
		

