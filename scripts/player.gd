extends CharacterBody2D
class_name Player

@export var player_name: String = "player1"
@export var input_keys: GameInput

@onready var name_label = $NameLabel

const SPEED = 160.0
const JUMP_VELOCITY = -310.0
const LADDER_SPEED = 64.0
const VERTICAL_MOVE_THRESHOLD = 0.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var double_jumped = false
var fall_size = 0.0
var dead = false
var is_on_ladder = 0
var is_climbing = false
var ladder_position_x = 0.0

func _ready():
	move_and_slide()
	load_player_data()
	name_label.text = player_name

	InputManager.jump.connect(func():
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			double_jumped = false
			Sounds.play_jump()
		elif double_jumped == false:
			velocity.y += JUMP_VELOCITY
			double_jumped = true
			Sounds.play_jump()
	)

func _physics_process(delta):
	if dead:
		return

	# ladders
	elif is_on_ladder > 0:
		double_jumped = false
		if is_on_floor():
			is_climbing = false
		else:
			is_climbing = true

		velocity.x = 0
		var v_direction = InputManager.get_direction().y

		if v_direction < -VERTICAL_MOVE_THRESHOLD:
			velocity.y = -LADDER_SPEED
			global_position.x = ladder_position_x
		elif v_direction > VERTICAL_MOVE_THRESHOLD:
			velocity.y = LADDER_SPEED
			global_position.x = ladder_position_x
		else:
			velocity.y = 0.0
	else:
		velocity.y += gravity * delta

	# running
	var direction = InputManager.get_direction().x

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	save_player_data()

	# pushing boxes
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		var collider = c.get_collider()
		if collider is Box && global_position.y - 5.0 < collider.global_position.y && global_position.y + 5 > collider.global_position.y:
			collider.velocity.x = direction * SPEED

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

func _on_ladder_entered(area: Area2D):
	is_on_ladder += 1
	ladder_position_x = area.global_position.x

func _on_ladder_exited(_area: Area2D):
	is_on_ladder -= 1
	if is_on_ladder == 0:
		is_climbing = false

func _on_danger_area_entered(_area: Area2D):
	dead = true

func _on_enemy_area_entered(_area:Area2D):
	dead = true
