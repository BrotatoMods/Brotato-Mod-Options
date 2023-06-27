class_name ModsConfigInterface
extends Node


signal setting_changed(setting_name, value, mod_name)

const LOG_NAME = "dami-ModOptions"

var mod_configs := {}

func _ready():
	ModLoaderUtils.log_info("Loading mod configs", LOG_NAME)
	var nb_configs := 0
	
	for mod in ModLoader.mod_load_order:
		if mod is ModData:
			var mod_name:String = mod.dir_name
			var mod_config:Dictionary = mod.config
			
			_add_default_keys_if_needed(mod_config, mod.manifest.config_defaults)
			
			if mod_config.empty():
				ModLoaderUtils.log_info(mod_name + " : No config found", LOG_NAME)
			
			else:
				ModLoaderUtils.log_info(mod_name + " : " + str(mod.config), LOG_NAME)
				nb_configs += 1
				mod_configs[mod_name] = mod_config
				
				
			
			
		
	ModLoaderUtils.log_info(str(nb_configs) + " mod configs loaded", LOG_NAME)
	pass


func _add_default_keys_if_needed(config:Dictionary, defaults:Dictionary):
	for default_key in defaults.keys():
		
		if not config.has(default_key):
			config[default_key] = defaults[default_key]


func on_setting_changed(setting_name:String, value, mod_name:String):
	var current_config = mod_configs[mod_name]
	current_config[setting_name] = value
	
	for mod in ModLoader.mod_load_order:
		if mod is ModData and mod.dir_name == mod_name:
			mod.config = current_config
	
	emit_signal("setting_changed", setting_name, value, mod_name)




