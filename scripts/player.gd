extends CharacterBody2D
class_name Player

@export var player_name: String
@export var input_keys: GameInput

const SPEED = 225.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var double_jumped = false
var fall_size = 0.0
var dead = false

func _ready():
	move_and_slide()
	load_player_data()

func _physics_process(delta):
	if dead:
		return

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		fall_size += max(0, get_position_delta().y)
		print_debug("fall_size: ", fall_size)
	else:
		double_jumped = false
		if fall_size > 230.0:
			dead = true
		fall_size = 0.0

	# Handle jump.
	if Input.is_action_just_pressed(input_keys.up):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif !double_jumped:
			velocity.y += JUMP_VELOCITY
			double_jumped = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis(input_keys.left, input_keys.right)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	save_player_data()

func load_player_data():
	var data = State.get_player_data(player_name)
	if data != null:
		position = data.position	
		velocity = data.velocity
		double_jumped = data.double_jumped

func save_player_data():
	var player_data = PlayerData.new()
	player_data.position = position
	player_data.velocity = velocity
	player_data.double_jumped = double_jumped
	State.update_player_data(player_name, player_data)
