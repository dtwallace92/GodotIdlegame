extends Node

var count = 0
var baseUpgradeCost = 50 
var secondUpgradeCost = 200
var countIncrementValue = 5
var characterSize = 0.1
var lastGrowthCount = 0
var grow = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start() 
	$ImprovementCost.text = "Cost: " + str(baseUpgradeCost)
	$ClickerLabel.text = "+" + str(countIncrementValue)
	$SecondImprovementCost.text = "Cost: " + str(secondUpgradeCost)
	$AnimatedSprite.set_scale(Vector2(characterSize, characterSize))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Counter.text = "Total: " + str(count)
	_checkForGrowth()

func _on_Timer_timeout():
	count += countIncrementValue
	$Timer.start()

func _on_Clicker_Button_pressed():
	count += countIncrementValue

func _on_Improvement_Button_pressed():
	if count > baseUpgradeCost:
		count = (count - baseUpgradeCost)
		countIncrementValue +=1
		baseUpgradeCost += 20
		$ImprovementCost.text = "Cost: " + str(baseUpgradeCost)
		$ClickerLabel.text = "+" + str(countIncrementValue)

func _on_SecondImprovementButton_pressed():
	if count > secondUpgradeCost:
		count = (count - secondUpgradeCost)
		countIncrementValue += 25
		secondUpgradeCost += 100
		$SecondImprovementCost.text = "Cost: " + str(secondUpgradeCost)
		$ClickerLabel.text = "+" + str(countIncrementValue)

func _checkForGrowth():
	if count - lastGrowthCount >= 25:
		lastGrowthCount += 25
		_growCharacter()
		
		## Not functional ##
		if characterSize >= 1:
			_splitSprite()
			$Counter.text = "characterSize = 1"

func _growCharacter():
	characterSize += 0.5
	$AnimatedSprite.set_scale(Vector2(characterSize, characterSize))

 ## Not Functional ##
func _splitSprite():
	var newSprite = AnimatedSprite
	newSprite.set_frame("res://icon.png")
	newSprite.set_scale(Vector2(characterSize, characterSize))
	characterSize == 0.1
	$AnimatedSprite.set_scale(Vector2(characterSize, characterSize))
	newSprite.position.x = $AnimatedSprite.position.x + 30
	newSprite.position.y = $AnimatedSprite.position.y
