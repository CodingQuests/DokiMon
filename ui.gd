extends CanvasLayer



func _ready():
	$BG.visible = false
	$BGInv.visible = false


func _process(delta):
	if Input.is_action_just_pressed("Inv"):
		updateInv()
		get_tree().paused = !get_tree().paused
		$BGInv.visible = !$BGInv.visible






func _on_doki_mon_gui_input(event, extra_arg_0):
	if event.is_action_pressed("LeftClick"):
		$BGInv/Info/Name.text = Game.SelectedDokiMons[extra_arg_0]["Name"]
		$BGInv/Info/Icon.frame = Game.SelectedDokiMons[extra_arg_0]["Frame"]
		$BGInv/Info/Desc.text = ("Level: " + str(Game.SelectedDokiMons[extra_arg_0]["Level"]) 
			+ "\nHealth: "+ str(Game.SelectedDokiMons[extra_arg_0]["Health"])
			+ "\nStrength: "+ str(Game.SelectedDokiMons[extra_arg_0]["Strength"])
			+ "\nDefense: "+ str(Game.SelectedDokiMons[extra_arg_0]["Defense"])
			+ "\nExp: "+ str(Game.SelectedDokiMons[extra_arg_0]["Exp"]) + "/" + str(Game.SelectedDokiMons[extra_arg_0]["MaxExp"])
			)



func updateInv():
	for i in $BGInv/Container.get_child_count():
		$BGInv/Container.get_child(i).hide()
	for i in Game.SelectedDokiMons:
		$BGInv/Container.get_child(i).get_child(0).frame = Game.SelectedDokiMons[i]["Frame"]
		$BGInv/Container.get_child(i).show()
	$BGInv/Info/Name.text = Game.SelectedDokiMons[0]["Name"]
	$BGInv/Info/Icon.frame = Game.SelectedDokiMons[0]["Frame"]
	$BGInv/Info/Desc.text = ("Level: " + str(Game.SelectedDokiMons[0]["Level"]) 
		+ "\nHealth: "+ str(Game.SelectedDokiMons[0]["Health"])
		+ "\nStrength: "+ str(Game.SelectedDokiMons[0]["Strength"])
		+ "\nDefense: "+ str(Game.SelectedDokiMons[0]["Defense"])
		+ "\nExp: "+ str(Game.SelectedDokiMons[0]["Exp"]) + "/" + str(Game.SelectedDokiMons[0]["MaxExp"])
		)
