extends Sprite2D

var movement_speed = 150
var normal_speed = 150
var sprint_speed = 300
var rotation_speed = 50
var scale_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Input.is_action_pressed("move_up"):
		position = position + Vector2(0,-1) * movement_speed * delta
	if Input.is_action_pressed("move_down"):
		position = position + Vector2(0,1) * movement_speed * delta
	if Input.is_action_pressed("move_left"):
		position = position + Vector2(-1,0) * movement_speed * delta
	if Input.is_action_pressed("move_right"):
		position = position + Vector2(1,0) * movement_speed * delta
	if Input.is_action_pressed("sprint"):
		movement_speed = sprint_speed 
	else: movement_speed = normal_speed 
	if Input.is_action_just_pressed("teleport"):
		position = get_global_mouse_position()
# I put in a rotation feature on the 2d character because the change would be more visable here then on 3d if I were to rotate the bean mesh
	if Input.is_action_pressed("rotate_left_2d"):
		rotation = rotation + deg_to_rad(-1) * rotation_speed * delta
	if Input.is_action_pressed("rotate_right_2d"):
		rotation = rotation + deg_to_rad(1) * rotation_speed * delta
#I also decided to do scaling but did it in 2D as I thought it would be easier to do and less confusing
	if Input.is_action_pressed("scale_big_2d"):
		scale = scale + Vector2 (1,1) * scale_speed * delta
	if Input.is_action_pressed("scale_small_2d"):
		scale = scale + Vector2 (-1,-1) * scale_speed * delta
