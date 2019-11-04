extends KinematicBody2D

var move_vec : Vector2 = Vector2.ZERO
var click_vec: Vector2 = Vector2.ZERO
var jump :     = -350.0
var grav :     =  6.0
var speed :    =  250.0
var max_grav : =  200.0

func _input(event):
	if ( (event is InputEventMouseButton) and
			event.button_index == BUTTON_LEFT and
			event.pressed ) and is_on_floor():
		click_vec = (get_global_mouse_position() - self.position).clamped(speed)
		move_vec.y = range_lerp(click_vec.y, 0.0, -speed, -60.0, jump)

func _physics_process(_delta):
	if !is_on_floor():
		move_vec.y += (grav) if move_vec.y < max_grav else 0.0
		move_vec.x = click_vec.x
	else:
		move_vec.x = 0
	move_and_slide(move_vec, Vector2.UP)