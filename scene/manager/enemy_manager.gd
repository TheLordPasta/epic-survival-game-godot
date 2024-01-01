extends Node

const SPAWN_RADIUS = 330

@export var basic_enemy_scene: PackedScene

func _ready():
	$Timer.timeout.connect(on_timer_timeout) 


func  on_timer_timeout():
	#get player
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	
	#creating a random vector from player to spawn enemy in range
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
	
	
	#creating the enemy
	var enemy = basic_enemy_scene.instantiate()
	get_parent().add_child(enemy)
	enemy.global_position = spawn_position
