extends Node

func play_hover():
	play(preload("res://assets/sounds/hover.mp3"))

func play_press():
	play(preload("res://assets/sounds/press.mp3"))

func play_appear():
	# TODO: for now its the same sound as press
	play(preload("res://assets/sounds/press.mp3"))

func play_jump():
	play(preload("res://assets/sounds/jump.mp3"))

func play(stream):
	var audio_steam_player = AudioStreamPlayer.new()
	audio_steam_player.stream = stream
	add_child(audio_steam_player)
	audio_steam_player.play()
	await audio_steam_player.finished
	audio_steam_player.queue_free()
