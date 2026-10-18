extends CanvasLayer

var selectedProperty: String
var selectedOperand:int

signal createSpell
signal castSpell

func _ready() -> void:
	#menubutton overhead
	#Property Field
	#make a lambda function for the popup menu to call when signaling
	var prop:Callable = func(id):
		selectedProperty = $Properties.get_popup().get_item_text(id)
	#get the popup menu
	var propertyPopUp = $Properties.get_popup()
	#connect the signal to the lambda
	propertyPopUp.connect("id_pressed", prop)
	
	#Operator Field
	#make a lambda function for the popup menu to call when signaling
	var op:Callable = func(id):
		selectedOperand = id
	#get the popup menu
	var operandPopUp = $operator.get_popup()
	#connect the signal to the lambda
	operandPopUp.connect("id_pressed", op)
	
#used to populate the property menubuttion on parent nodes _ready()
func addToPopUp(name:String):
	$Properties.get_popup().add_item(name)

#forwards signal from button press to main with the following variables from the hud inmputs: selectedProperty, selectedOperand, value
func _on_button_pressed() -> void:
	var value = $LineEdit.text	
	createSpell.emit(selectedProperty, selectedOperand, value)

#forwads the signal from the cast spell button
func _on_button_2_pressed() -> void:
	castSpell.emit() # Replace with function body.
