extends CharacterBody2D

enum states {attack, wander, idle, chase}
var currentState = states.idle
var rng = RandomNumberGenerator.new()
var speed = 200
var wanderDirection = Vector2.ZERO
var lastChangeState = false;
var justChangeState = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match currentState:
		states.attack:
			attack()
		states.wander:
			wander()
		states.idle:
			idle()
		states.chase:
			chase()
			
	if(lastChangeState != justChangeState):
		lastChangeState = justChangeState
	else:
		justChangeState = false

func changeState(state):
	currentState = state
	justChangeState = true

func attack():
	pass

func chase():
	pass

func wander():
	if(justChangeState):
		wanderDirection = Vector2(rng.randf_range(250, -250),rng.randf_range(250, -250)).normalized()
	velocity = wanderDirection * speed
	
	if(rng.randi_range(0, 30) == 0):
		changeState(states.idle)

func idle():
	velocity = Vector2.ZERO;
	if(rng.randi_range(0, 100) == 0):
		changeState(states.wander)


func checkForPlayer():
	pass
