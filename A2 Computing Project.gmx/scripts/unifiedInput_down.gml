///unifiedInput_down(control ID, key);

var control_ID       = argument[0];
var control_key      = argument[1];

var keyboard_input = ds_grid_get(con_unifiedInput.input_keyboardGrid, control_ID, control_key);
var gamepad_input  = ds_grid_get(con_unifiedInput.input_gamepadGrid , control_ID, control_key);

var analog_return = false;

if (keyboard_check(keyboard_input))
{
    return true;
}

if (unifiedInput_isAnalog(gamepad_input))
{
    analog_return = unifiedInput_analogSticks(control_ID, gamepad_input);
    return analog_return;
}
else
{
    if (gamepad_button_check(control_ID - 1, gamepad_input))
    {
        return true;
    }
}

return false;
