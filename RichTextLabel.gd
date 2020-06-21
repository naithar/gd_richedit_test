extends Control

var array = null
var item = null

func _ready():
	
	array = [$Control2, $Control]
	item = $Control2
	print(array)
	print(item)
	
	$Control2.queue_free()
	remove_child($Control2)
	
	print(array)
	print(item)
	
func _process(delta):
	print(array)
	print(item)
