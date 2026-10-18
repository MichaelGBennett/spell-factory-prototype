class_name SpellFactory
#use class_name for scripts to reference each other

#createSpell takes a string for the name of the property of the Sprite2d, 
#an int representing the operand we want to use(= or +=), 
#and the value to replace or add to the property
static func createSpell(name:String, opp:int, value) -> Callable:
	#return a lambda func
	#the lambda accepts a Sprite2D object
	return func(doo:Sprite2D):
		print(name, opp, value)
		doo.set(name, value)#Set the property (name) of the Sprite2D to the value
		var property = doo.get(name)
		print(property)
