extends RichTextLabel

var should_scroll = false
var use_physics = false
var use_timeout = false

func _on_RichTextLabel_meta_clicked(meta):
	print(meta)
	OS.shell_open(meta)
	
func _physics_process(delta: float) -> void:
	if not should_scroll: return
	if not use_physics: return
	scroll(delta)
	
func _process(delta):
	if not should_scroll: return
	if use_physics: return
	scroll(delta)
	
func scroll(delta):
	# using
	# get_v_scroll().value += 1
	# does not change the behaviour
	
	get_v_scroll().value += 50 * delta
	
	if get_v_scroll().value > 500:
		get_v_scroll().value = 0


#func _input(event: InputEvent) -> void:
#	if event is InputEventScreenTouch:
#		set_physics_process(not event.pressed)


func _on_CheckBox_toggled(button_pressed):
	should_scroll = button_pressed

func _on_Physics_toggled(button_pressed):
	use_physics = button_pressed

func _on_Timeout_toggled(button_pressed):
	use_timeout = button_pressed

func _on_RichTextLabel_gui_input(event):
	if not use_timeout: return
	if not (event and event is InputEventScreenTouch and event.pressed): return
	if not should_scroll: return
	
	should_scroll = false
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.6)
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	print("returning scroll value")
	should_scroll = $"../Scroll".pressed
