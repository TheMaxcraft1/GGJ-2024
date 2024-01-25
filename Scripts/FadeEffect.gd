extends CanvasLayer

func scene_transition(target):
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")

func set_animation_color(color):
	$ColorRect.color = color
