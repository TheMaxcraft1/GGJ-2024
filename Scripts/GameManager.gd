extends Node

var score : int # the actual player score ( may be the number of minigames passed? )
var ind_jones : int # Number of indiana jones minigame apppearances
var star_wars : int # Number of star wars minigame appearances
# One minigame left for designing and thinking...
var third_minigame

var WIDTH = 960 # Screen's width just for referencing
var HEIGHT = 540 # Screen's height just for referencing

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	ind_jones = 0
	star_wars = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
