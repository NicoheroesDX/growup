extends Node

var experience = 0
var health = 1
var size = 0

enum MOVE { DASH_MOVE, LEAF_BLAST, ROOT_SLASH }

var learnedMoves = []

func learnMove(move):
	learnedMoves.push_back(move)
