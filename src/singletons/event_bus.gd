extends Node

@warning_ignore_start("unused_signal")

signal player_health_changed(damage : float)
signal player_health_depleted
signal player_mana_changed(cost : float)
signal player_mana_depleted
signal enemy_health_changed(damage : float)
signal enemy_health_depleted

signal level_cleared

signal ui_start_game
signal ui_pause
signal ui_resume
signal ui_back_to_menu
signal ui_exit

@warning_ignore_restore("unused_signal")
