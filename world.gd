extends Node2D

var score := 0

@onready var button: Button = $Button
@onready var score_label: Label = $ScoreLabel
@onready var time_label: Label = $TimeLabel
@onready var timer: Timer = $Timer


func _process(_delta: float) -> void:
	var time_left := ceili(timer.time_left)
	time_label.text = "Time: %d" % time_left

	if timer.is_stopped():
		set_process(false)


func game_over() -> void:
	score_label.text = "Time's up! Final score: %d" % score
	button.visible = false
	time_label.visible = false


func increase_score() -> void:
	score += 1
	score_label.text = "Score: %d" % score

	var viewport_size := get_viewport_rect().size
	var max_x := maxf(0, viewport_size.x - button.size.x)
	var max_y := maxf(0, viewport_size.y - button.size.y)
	var rand_x := randf_range(0, max_x)
	var rand_y := randf_range(0, max_y)
	button.position = Vector2(rand_x, rand_y)
