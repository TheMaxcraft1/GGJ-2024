extends Node2D

var patterns_dict = {
	"circle": ['res://Textures/StarWarsMiniGame/Patterns/CirclePattern.png', 'res://StarWarsPatternPoints/CirclePatternPoints.tres'],
	"star": ['res://Textures/StarWarsMiniGame/Patterns/StarPattern.png', 'res://StarWarsPatternPoints/StarPatternPoints.tres'],
	"stair": ['res://Textures/StarWarsMiniGame/Patterns/StairPattern.png', 'res://StarWarsPatternPoints/StairPatternPoints.tres'],
	"pentagon": ['res://Textures/StarWarsMiniGame/Patterns/PentagonPattern.png', 'res://StarWarsPatternPoints/PentagonPatternPoints.tres']
}
	

# Called when the node enters the scene tree for the first time.
func _ready():
	var patterns = patterns_dict.keys()
	randomize()
	var random_pattern_key = patterns[randi() % patterns.size()]
	var random_pattern_values = patterns_dict.get(random_pattern_key)
	var image_path = random_pattern_values[0]
	var pattern_points = random_pattern_values[1]
	$Background.texture = load(image_path)
	$CanvasLayer/Path2DSlider/Path2D.curve = load(pattern_points)
	
	if $CanvasLayer/Path2DSlider/Path2D.curve == null:
		print("ITS NULL")
	else:
		print($CanvasLayer/Path2DSlider/Path2D.curve.resource_path)	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str($CanvasLayer/Path2DSlider.progress_ratio)
