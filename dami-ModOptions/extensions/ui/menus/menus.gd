extends "res://ui/menus/menus.gd"



var _menu_mods_options

func _ready():
	_menu_mods_options = preload("res://mods-unpacked/dami-ModOptions/extensions/ui/menus/pages/menu_mods_options.tscn").instance()
	_menu_mods_options.hide()
	add_child(_menu_mods_options)
	
	var _error_back_mods_options = _menu_mods_options.connect("back_button_pressed", self, "on_options_mods_back_button_pressed")
	var _error_mods_choose_options = _menu_choose_options.connect("mods_button_pressed", self, "on_options_mods_button_pressed")

func on_options_mods_back_button_pressed()->void :
	switch(_menu_mods_options, _menu_choose_options)

func on_options_mods_button_pressed()->void :
	switch(_menu_choose_options, _menu_mods_options)
