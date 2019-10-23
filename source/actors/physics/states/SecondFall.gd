extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Move":
			transition.is_moving = true
		"Stop":
			transition.is_moving = false
		"WallSlide":
			state_machine.change_state_to("WallSlide")


func _on_command_finished(command):
	match command:
		"Fall":
			if transition.is_moving:
				state_machine.change_state_to("Walk")
			else:
				state_machine.change_state_to("Idle")
