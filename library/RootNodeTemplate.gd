extends Node2D


const NODE_SOURCE: String = ""
const NODE_TARGET: String = ""

var _signal_name: String
var _func_name: String
var _var_name: String


func _ready() -> void:
	_set_signal()
	_set_node_ref()


func _set_signal() -> void:
	_signal_name = ""
	_func_name = ""

	_connect(NODE_SOURCE, NODE_TARGET)


func _connect(source_node: String, target_node: String) -> void:
	var __ = get_node(source_node).connect(_signal_name,
			get_node(target_node), _func_name)

func _set_node_ref() -> void:
	_var_name = ""

	_ref(NODE_SOURCE, NODE_TARGET)


func _ref(source_node: String, target_node: String) -> void:
	get_node(source_node)[_var_name] = get_node(target_node)
