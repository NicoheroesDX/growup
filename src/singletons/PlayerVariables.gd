extends Node

var experience = 0
var health = 1
var size = 0

enum MOVE { DASH_MOVE, LEAF_BLAST }

var learnedMoves = [MOVE.DASH_MOVE]
