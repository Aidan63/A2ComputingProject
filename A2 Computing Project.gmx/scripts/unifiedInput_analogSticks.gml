///unifiedInput_analogSticks(control ID, gamepad input);

var ID        = argument[0];
var input     = argument[1];
var deadzone  = 0.5;

switch (input)
{
    case gamepad_left_stick_up:
        if (gamepad_axis_value(ID, gp_axislv) < -deadzone)
        {
            return true;
        }
    break;
    
    case gamepad_left_stick_down:
        if (gamepad_axis_value(ID, gp_axislv) > deadzone)
        {
            return true;
        }
    break;
    
    case gamepad_left_stick_left:
        if (gamepad_axis_value(ID, gp_axislh) < -deadzone)
        {
            return true;
        }
    break;
    
    case gamepad_left_stick_right:
        if (gamepad_axis_value(ID, gp_axislh) > deadzone)
        {
            return true;
        }
    break;
    
    case gamepad_right_stick_up:
        if (gamepad_axis_value(ID, gp_axisrv) < -deadzone)
        {
            return true;
        }
    break;
    
    case gamepad_right_stick_down:
        if (gamepad_axis_value(ID, gp_axisrv) > deadzone)
        {
            return true;
        }
    break;
    
    case gamepad_right_stick_left:
        if (gamepad_axis_value(ID, gp_axisrh) < -deadzone)
        {
            return true;
        }
    break;
    
    case gamepad_right_stick_right:
        if (gamepad_axis_value(ID, gp_axisrh) > deadzone)
        {
            return true;
        }
    break;
}

return false;

