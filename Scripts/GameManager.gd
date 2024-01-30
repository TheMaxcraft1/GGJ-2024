extends Node

var score : int # the actual player score ( may be the number of minigames passed? )
var ind_jones : int # Number of indiana jones minigame apppearances
var star_wars : int # Number of star wars minigame appearances
# One minigame left for designing and thinking...
var et : int

var currentMG : String # Current minigame for transition backgrounds

var WIDTH = 960 # Screen's width just for referencing
var HEIGHT = 540 # Screen's height just for referencing

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	ind_jones = 0
	star_wars = 0
	et = 0
	
