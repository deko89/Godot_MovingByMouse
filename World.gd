extends Spatial

# Mouse
var mousePosScreen = Vector2()
# Select and movint objects by mouse.
const mousePickLen = 1000000
var mousePickNeedCalc = false
	# Movint objects by mouse.
var mouseMoveIsOn = false
var mouseMoveIsFirstStep = true
var mouseMovePosGround = Vector3()

func ClearSel():
	var aSel = get_tree().get_nodes_in_group("selected")
	for sel in aSel:
		sel.remove_from_group("selected")

func CalcIntersect(collision_mask: int):
	var camera = $player/camera
	var from = camera.project_ray_origin(mousePosScreen)
	var to = from + camera.project_ray_normal(mousePosScreen) * mousePickLen
	var space_state = get_world().direct_space_state
	return space_state.intersect_ray(from, to, [], collision_mask)

func _physics_process(_delta):
	# Select Objects.
	if (mousePickNeedCalc):
		var intersectState = CalcIntersect(global.pickMask)
		if (intersectState):
			intersectState.collider.add_to_group("selected")
		mousePickNeedCalc = false
	# Movint objects by mouse.
	if (mouseMoveIsOn):
		# Calc ray intersect with ground.
		var intersectState = CalcIntersect(global.groundMask)
		# Parse
		if (intersectState):
			# If first, only save start point.
			if (mouseMoveIsFirstStep):
				mouseMovePosGround = intersectState.position
				mouseMoveIsFirstStep = false
			# Else.
			else:
				# Calc ofset
				var posDelta = intersectState.position - mouseMovePosGround
				mouseMovePosGround = intersectState.position
				# Moving.
				if ( posDelta != Vector3() ):
					get_tree().call_group("selected", "global_translate", posDelta)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			mousePosScreen = event.position
			# Select objects.
			if not Input.is_key_pressed(KEY_SHIFT):
				ClearSel()
			mousePickNeedCalc = true
			# Moving data.
			mouseMoveIsFirstStep = true
			mouseMoveIsOn = true
		else:
			mouseMoveIsOn = false
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(BUTTON_LEFT):
		mousePosScreen = event.position
