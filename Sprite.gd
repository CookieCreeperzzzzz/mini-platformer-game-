
extends Sprite


func _ready():
	set_fixed_process(true)
	
func _fixed_process(detla):
	get_parent().set_offset(get_parent().get_offset() + (50*detla))

