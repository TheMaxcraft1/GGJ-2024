extends Control


func _on_play_pressed(): #Boton de Play
	pass # Replace with function body.




func _on_options_pressed(): #Boton Options
	get_tree().change_scene_to_file("res://Scenes/OptionsMenu.tscn")
	
	




func _on_exit_pressed(): #Boton Exit
	get_tree().quit()
