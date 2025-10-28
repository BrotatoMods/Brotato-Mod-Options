extends "res://ui/menus/title_screen/title_screen.gd"

# TODO move this file to what its actually extending
onready var menu_options = $Menus/MenuOptions
#onready var options_container = $Buttons/HBoxContainer2

func _ready():
	var button_container = menu_options.get_node_or_null("Buttons/HBoxContainer2")
	var button_controller = menu_options.get_node_or_null("Buttons")
	
	var last_button_index = button_container.get_child_count() - 2

	var accessibility_button = button_container.get_child(last_button_index)
	var mod_options_button = accessibility_button.duplicate()
	button_container.add_child_below_node(accessibility_button, mod_options_button)
	mod_options_button.connect("pressed", button_controller, "_change_tab", [last_button_index])
	button_controller.buttons_tab_np.push_back(mod_options_button.get_path())

#	print_debug("we are extending!!!" , menu_options, " ", button_container)
#	pass
#	print_debug("var options? ", options_container)
#
#	_mods_button = $Buttons / BackButton.duplicate()
#	_mods_button.connect("pressed", self, "_on_ModsButton_pressed")
#	_mods_button.disconnect("pressed", self, "_on_BackButton_pressed")
#	_mods_button.text = "Mods"
#	var option_buttons = $Buttons.get_children()
#	var before_to_last_index = $Buttons.get_child_count() - 2
#	var before_to_last = option_buttons[before_to_last_index]
#	$Buttons.add_child_below_node(before_to_last, _mods_button)
	

#
#func _on_ModsButton_pressed()->void :
#	emit_signal("mods_button_pressed")

