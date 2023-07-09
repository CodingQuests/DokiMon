extends CanvasLayer

var pinkMon = preload("res://Monsters/PinkMon.tscn")

var selected = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var montemp = pinkMon.instantiate()
	$Enemy.add_child(montemp)
	$UI/Menu.hide()
	$UI/Switch.hide()
	$UI/Fight.hide()
	$UI/Menu/GridContainer/Fight.grab_focus()
	
	await get_tree().create_timer(2).timeout
	
	for i in Game.SelectedDokiMons:
		var monTemp = Game.SelectedDokiMons[i]["Scene"].instantiate()
		monTemp.name = Game.SelectedDokiMons[i]["Name"]
		monTemp.hide()
		$Player.add_child(monTemp)
	$Player.get_child(0).show()
	$UI/Menu.show()

func _on_capture_pressed():
	if $Enemy.get_child(0).Health <= ($MonsterUI.maxHealth/2):
		$Enemy.get_child(0).capture()
		Game.addEXP(10)
		if "PinkMon" in $Enemy.get_child(0).name:
			Game.addDokiMon("PinkMon")
		elif "Purple" in $Enemy.get_child(0).name:
			Game.addDokiMon("PurpleMon")
		elif "Green" in $Enemy.get_child(0).name:
			Game.addDokiMon("GreenMon")
		Utils.save_game()
func MonsterTurn():
	$UI/Menu.hide()
	$UI/Switch.hide()
	$UI/Fight.hide()
	
	var damage = randi_range(10,15)
	$Action.text = "Enemy is thinking....."
	
	await get_tree().create_timer(1).timeout
	if $Enemy.get_child(0).Health <= 0:
		Game.addEXP(10)
		get_tree().paused = false
		queue_free()
		Utils.save_game()
	$Player.get_child(selected).hit("Blast", damage)
	$Action.text = "Enemy " + $Enemy.get_child(0).name + " Has attacked using BLAST for " + str(damage) +" hp"
	Game.SelectedDokiMons[selected]["Health"] -= damage
	await get_tree().create_timer(2).timeout
	$UI/Menu/GridContainer/Fight.grab_focus()
	$UI/Menu.show()
	
