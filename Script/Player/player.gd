extends CharacterBody2D

var SPEED = 0
var number = 0
var human
var rat
var bear
var deer

func _ready():
	human = get_tree().get_root().get_node("Room1").human
	rat = get_tree().get_root().get_node("Room1").rat
	bear = get_tree().get_root().get_node("Room1").bear
	deer = get_tree().get_root().get_node("Room1").deer
	changes()

func _process(delta):
	if(number == 0):
		return
	if(Input.is_action_just_pressed("shift1") && number != 1):
		shift(1)
	elif(Input.is_action_just_pressed("shift2") && number != 2):
		shift(2)
	elif(Input.is_action_just_pressed("shift3") && number != 3):
		shift(3)
	elif(Input.is_action_just_pressed("shift4") && number != 4):
		shift(4)
	
	look_at(get_global_mouse_position())

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	
	move_and_slide()

func shift(shift):
	var ShiftTo
	match shift:
		1:
			ShiftTo = human.instantiate()
		2:
			ShiftTo = rat.instantiate()
		3: 
			ShiftTo = bear.instantiate()
		4:
			ShiftTo = deer.instantiate()
	
	get_tree().get_root().add_child(ShiftTo)
	ShiftTo.position = position
	
	queue_free()
func changes():
	pass
