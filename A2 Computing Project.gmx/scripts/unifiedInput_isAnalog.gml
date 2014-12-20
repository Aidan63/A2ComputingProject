///unifiedInput_isAnalog(input value);

var input = argument[0];

if (input == gamepad_left_stick_up || input == gamepad_left_stick_down || input == gamepad_left_stick_left || input == gamepad_left_stick_right || input == gamepad_right_stick_up || input == gamepad_right_stick_down || input == gamepad_right_stick_left || input == gamepad_right_stick_right)
{
    return true;
}
else
{
    return false;
}