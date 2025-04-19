extends Control


var totalMoney = 70  # Example value, update this accordingly
var mortgagePaid = false
var foodPaid = false
var otherPaid = false

func _ready():
	var label = $Label11  # Assuming "Label11" is a direct child of the node with this script
	
	label.text = "Money Left: " + str(totalMoney)
	$Label12.visible = false
	$Label13.visible = false
	$Label14.visible = false

func update_money(new_value):
	totalMoney = totalMoney + new_value
	$Label11.text = "Money Left: " + str(totalMoney)

func _on_PayMortgage_pressed() -> void:
	if (mortgagePaid == false):
		update_money(-30)
		mortgagePaid = true
	else:
		update_money(30)
		mortgagePaid = false
	


func _on_payFood_pressed() -> void:
	if (foodPaid == false):
		update_money(-20)
		foodPaid = true
	else:
		update_money(20)
		foodPaid = false


func _on_payOther_pressed() -> void:
	if (otherPaid == false):
		update_money(-30)
		otherPaid = true
	else:
		update_money(30)
		otherPaid = false


func _on_SignOff_pressed() -> void:
	if (totalMoney < 0):
		$Label12.visible = true
	else:
		$Label12.visible = false
		$Label13.visible = true
		$Label14.visible = true
		
