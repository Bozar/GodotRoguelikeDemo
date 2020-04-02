extends VBoxContainer


onready var _label_help: Label = get_node("Help")
onready var _label_turn: Label = get_node("Turn")


func _ready() -> void:
	_label_help.text = "RL Demo"
	_label_turn.text = "Turn: 1"
