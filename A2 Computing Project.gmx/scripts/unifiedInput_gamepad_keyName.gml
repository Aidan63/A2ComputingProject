///unifiedInput_keyName(key value);

switch (argument[0])
{    
    case gp_face1     : return "A"            ; break;
    case gp_face2     : return "B"            ; break;
    case gp_face3     : return "X"            ; break;
    case gp_face4     : return "Y"            ; break;
    
    case gp_shoulderl : return "Left Bumper"  ; break;
    case gp_shoulderlb: return "Left Trigger" ; break;
    case gp_shoulderr : return "Right Bumper" ; break;
    case gp_shoulderrb: return "Right Trigger"; break;
    case gp_stickl    : return "Left Stick"   ; break;
    case gp_stickr    : return "Right Stick"  ; break;
    case gp_start     : return "Start"        ; break;
    case gp_select    : return "Select"       ; break;
    
    case gamepad_left_stick_up   : return "Left Stick Up"   ; break;
    case gamepad_left_stick_down : return "Left Stick Down" ; break;
    case gamepad_left_stick_left : return "Left Stick Left" ; break;
    case gamepad_left_stick_right: return "Left Stick Right"; break;
    
    case gamepad_right_stick_up   : return "Right Stick Up"   ; break;
    case gamepad_right_stick_down : return "Right Stick Down" ; break;
    case gamepad_right_stick_left : return "Right Stick Left" ; break;
    case gamepad_right_stick_right: return "Right Stick Right"; break;
    
    case gp_padu: return "Dpad Up"   ; break;
    case gp_padd: return "Dpad Down" ; break;
    case gp_padl: return "Dpad Left" ; break;
    case gp_padr: return "Dpad Right"; break;
    
    default: return "unknown button : " + string(argument0); break;
}