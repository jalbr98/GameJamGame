extends CharacterBody2D

const SPEED = 300.0
var rat

func _ready():
	rat = get_tree().get_root().get_node("Room1").rat

func _process(delta):
	if(Input.is_action_just_pressed("shift1")):
		shift()

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	
	move_and_slide()

func shift():
	var ShiftTo = rat.instantiate()
	get_tree().get_root().add_child(ShiftTo)
	ShiftTo.position = position
	
	queue_free()
