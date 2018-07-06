extends Area2D

export(String, FILE ,"*.tscn") var world_scen

func _physics_Process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body. name=="player":
			get_tree().change_scene("world.tsnc")