extends Control

var array = null

func _ready():
	
	array = [$Control2, $Control]
	
	print(array)
	
	$Control2.queue_free()
	remove_child($Control2)
	
	print(array)
	
func _process(delta):
	print(array)
