extends Control

var maxHealth
func _ready():
	
	await get_tree().create_timer(0.5).timeout
	maxHealth = $"../Enemy".get_child(0).Health
	$HPBar.max_value = $"../Enemy".get_child(0).Health
	$HPBar.value = $"../Enemy".get_child(0).Health
	
func _process(delta):
	$HPBar.value = $"../Enemy".get_child(0).Health
	$HpTxt.text = str($"../Enemy".get_child(0).Health) + " / " +str(maxHealth)
	$Info.text = "Monster " + str($"../Enemy".get_child(0).name) + " LVL " + str($"../Enemy".get_child(0).Level)
	
