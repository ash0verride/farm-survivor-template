if(!(instance_exists(obj_pause_screen)) && !(instance_exists(obj_upgrade_screen)) && !(instance_exists(obj_game_over)) && !(instance_exists(obj_template_complete)))
{
	// Stores how many gamepad count
	var _max_pads = gamepad_get_device_count();

	// Checks when at least 1 gamepad is present
	if (_max_pads > 0)
	{
		// Checks the gamepad is connected
		if (gamepad_is_connected(0))
		{
			if (gamepad_button_check_pressed(0, gp_start))
			{
				audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);
		
				// Create pause screen.
				instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_pause_screen);
		
				// Call the pause function.
				pause();
				
				exit;
			}
		}
	}
	
	if (has_released && keyboard_check(vk_escape))
	{
		audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);
		
		// Create pause screen.
		instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_pause_screen);
		
		// Call the pause function.
		pause();
		
		has_released = false;
		
		exit;
	}
	else
	{
		if (!keyboard_check(vk_escape))
		{
			has_released = true;	
		}
	}
	
	// If mouse is over this instance, adjusting for the GUI layer...
	if(device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
	{
		if (mouse_check_button_pressed(mb_left))
		{
			audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
			
			// Sets click state to true
			is_clicked = true;
		}
	
		// Checks if mouse has been clicked on this button
		if (is_clicked)
		{
			// If left mouse button is released.
			if (mouse_check_button_released(mb_left))
			{
				audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);
		
				// Create pause screen.
				instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_pause_screen);
		
				// Call the pause function.
				pause();
			}
		}
	}
	else
	{
		// Sets click state to false
		is_clicked = false;	
	}
}