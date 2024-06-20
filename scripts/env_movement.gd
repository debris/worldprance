@tool
extends Node
class_name EnvMovement

@export var node: Node2D
@export var time: float
@export var path: Path2D
@export var loop_mode: Animation.LoopMode = Animation.LOOP_LINEAR

func _ready():
	deferred_ready.call_deferred()

func deferred_ready():
	var animation_player = AnimationPlayer.new()

	var path_follow = PathFollow2D.new()
	path_follow.rotates = false

	var remote_transform = RemoteTransform2D.new()
	remote_transform.remote_path = node.get_path()

	path_follow.add_child(remote_transform)
	path.add_child(path_follow)
	path.add_child(animation_player)

	var path_follow_path: NodePath = path.get_path_to(path_follow)
	var path_follow_progress_path: NodePath = "%s:progress_ratio" % path_follow_path

	var animation = Animation.new()
	animation.length = time
	animation.loop_mode = loop_mode
	var progress_path_id = animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(progress_path_id, path_follow_progress_path)
	animation.track_insert_key(progress_path_id, 0.0, 0.0)
	animation.track_insert_key(progress_path_id, time, 1.0)

	var animation_library = AnimationLibrary.new()
	animation_library.add_animation("RESET", animation)
	animation_player.add_animation_library("", animation_library)
	animation_player.play("RESET")
