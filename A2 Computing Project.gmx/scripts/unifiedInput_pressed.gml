///unifiedInput_pressed(control ID, key);

var control_ID  = argument[0];
var control_key = argument[1];

var keyboard_input = ds_grid_get(con_unifiedInput.input_keyboardGrid, control_ID, control_key);
var gamepad_input  = ds_grid_get(con_unifiedInput.input_gamepadGrid , control_ID, control_key);

if (keyboard_check_pressed(keyboard_input))
{    
    return true;
}

if (unifiedInput_isAnalog(gamepad_input))
{
    return gamepad_axis_value(control_ID, gamepad_input);
}
else
{
    if (gamepad_button_check_pressed(control_ID - 1, gamepad_input))
    {
        return true;
    }
}

if (keyboard_check_pressed(ord("M")))
{
    show_debug_message(keyboard_input);
    show_debug_message(gamepad_input );
}