extends "res://ui/menus/pages/menu_choose_options.gd"

signal mods_button_pressed

var _mods_button

func _ready():
	
	_mods_button = $Buttons / BackButton.duplicate()
	_mods_button.connect("pressed", self, "_on_ModsButton_pressed")
	_mods_button.disconnect("pressed", self, "_on_BackButton_pressed")
	_mods_button.text = "Mods"
	var option_buttons = $Buttons.get_children()
	var before_to_last_index = $Buttons.get_child_count() - 2
	var before_to_last = option_buttons[before_to_last_index]
	$Buttons.add_child_below_node(before_to_last, _mods_button)
	


func _on_ModsButton_pressed()->void :
	emit_signal("mods_button_pressed")

