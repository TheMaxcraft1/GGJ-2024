extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	if GAMEMNGR.currentMG == "indiana_jones":
		$Background.texture = preload('res://Textures/TransitionBackgrounds/IndJonesTransitionBG.png')
	elif GAMEMNGR.currentMG == 'star_wars':
		pass
	else:
		pass
	
	
	
	
	$ScoreLabel.text = "PUNTAJE: " + str(GAMEMNGR.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_transition_time_timeout():
	#GO TO ANOTHER MINIGAME
	pass
