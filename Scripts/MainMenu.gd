extends Control

var minigames = ["res://Scenes/IndianaJonesMiniGame.tscn", "res://Scenes/StarWarsMiniGame.tscn"]

func _ready():
	GAMEMNGR.ind_jones = 0
	GAMEMNGR.star_wars = 0
	




func _on_settings_button_mouse_entered():
	$HoverButton.play()


func _on_play_button_mouse_entered():
	$HoverButton.play()


func _on_credits_button_mouse_entered():
	$HoverButton.play()


func _on_settings_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	$AnimationPlayer.play("settings_anim")


func _on_play_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	FADE_EFFECT.scene_transition(minigames[randi() % minigames.size()])
	

func _on_credits_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	$AnimationPlayer.play("credits_anim")


func _on_texture_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	$AnimationPlayer.play_backwards("settings_anim")


func _on_texture_button_mouse_entered():
	$HoverButton.play()


func _on_texture_button2_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	$AnimationPlayer.play_backwards("credits_anim")
	

func _on_texture2_button_mouse_entered():
	$HoverButton.play()
