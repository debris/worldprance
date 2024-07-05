extends Node
class_name Patrol

@export var character: CharacterBody2D

const SPEED = 75.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1.0

func _physics_process(delta):
	# Add the gravity.
	if not character.is_on_floor():
		character.velocity.y += gravity * delta

	if direction:
		character.velocity.x = direction * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)

	character.move_and_slide()

	if character.is_on_wall():
		direction *= -1.0
