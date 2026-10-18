extends Node

var spell:Callable

#at script start, populate the properties menu with the sprite2d properties
func _ready() -> void:
	#get_property_list returns an Array[Distionary]
	#iterate over the array and get the name from the dictionary to add to the HUD property menuButton
	for property in $Sprite2D.get_property_list():
		$Hud.addToPopUp(property.get("name"))

#on signal from HUD to create the spell, call the factory
func _on_hud_create_spell(name:String, opperand:int, value) -> void:
	spell = SpellFactory.createSpell(name, opperand, value)

#run the spell lambda function, when signaled by the HUD cast spell button
func _on_hud_cast_spell() -> void:
	spell.call($Sprite2D)
