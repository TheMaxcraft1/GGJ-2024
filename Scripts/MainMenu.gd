extends Control

func _ready():
	GAMEMNGR.ind_jones = 0
	GAMEMNGR.star_wars = 0
	


func _on_play_pressed(): #Boton de Play
	FADE_EFFECT.scene_transition('res://Scenes/IndianaJonesMiniGame.tscn')
	

func _on_options_pressed(): #Boton Options
	get_tree().change_scene_to_file("res://Scenes/OptionsMenu.tscn")


func _on_exit_pressed(): #Boton Exit
	get_tree().quit()
