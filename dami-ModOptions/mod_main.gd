extends Node



const MOD_DIR = "dami-ModOptions/"
const LOG_NAME = "dami-ModOptions"

var dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", LOG_NAME)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	
	# Add interface
	_add_child_class()
	
	# Add extensions
	modLoader.install_script_extension(ext_dir + "ui/menus/pages/menu_choose_options.gd")
	modLoader.install_script_extension(ext_dir + "ui/menus/menus.gd")
	
	# Add localizations
	modLoader.add_translation_from_resource(trans_dir + "modoptions_translations.en.translation")
	modLoader.add_translation_from_resource(trans_dir + "modoptions_translations.fr.translation")


func _add_child_class():
	var ModsConfigInterface = load(dir + "mods_config_interface.gd").new()
	ModsConfigInterface.name = "ModsConfigInterface"
	add_child(ModsConfigInterface)
