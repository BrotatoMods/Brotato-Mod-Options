extends "res://ui/menus/ingame/pause_menu.gd"

var option_tab = load("res://mods-unpacked/dami-ModOptions/mod_options_tab/mod_options_tab.tscn")


func _ready():
	var button_container = _menu_options.get_node_or_null("Buttons/HBoxContainer2")
	var button_controller = _menu_options.get_node_or_null("Buttons")
	
	var last_button_index = button_container.get_child_count() - 2

	var accessibility_button = button_container.get_child(last_button_index)
	var mod_options_button = accessibility_button.duplicate()
	button_container.add_child_below_node(accessibility_button, mod_options_button)
	mod_options_button.connect("pressed", button_controller, "_change_tab", [last_button_index])
	mod_options_button.text = "Mods"
	mod_options_button.icon = null
	button_controller.buttons_tab_np.push_back(mod_options_button.get_path())
	button_controller.tab_container.add_child(option_tab.instance())
