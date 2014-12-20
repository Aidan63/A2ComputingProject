///unifiedInput_keyboard_keyName(key value);

var _ord = argument[0];
var _chr = chr(_ord);

switch (_ord)
{
    case vk_control  : return "Control"    ; break;
    case vk_space    : return "Space"      ; break;
    case vk_shift    : return "Shift"      ; break;
    case vk_lshift   : return "Left Shift" ; break;
    case vk_rshift   : return "Right Shift"; break;
    case vk_alt      : return "Alt"        ; break;
    case vk_enter    : return "Enter"      ; break;
    case vk_escape   : return "Escape"     ; break;
    case vk_backspace: return "Backspace"  ; break;
    
    case vk_decimal: return "."     ; break;
    case vk_delete : return "Delete"; break;
    
    case vk_add     : return "+"; break;
    case vk_subtract: return "-"; break;
    case vk_multiply: return "*"; break;
    case vk_divide  : return "/"; break;
    
    case vk_numpad0: return "Numberpad 0"; break;
    case vk_numpad1: return "Numberpad 1"; break;
    case vk_numpad2: return "Numberpad 2"; break;
    case vk_numpad3: return "Numberpad 3"; break;
    case vk_numpad4: return "Numberpad 4"; break;
    case vk_numpad5: return "Numberpad 5"; break;
    case vk_numpad6: return "Numberpad 6"; break;
    case vk_numpad7: return "Numberpad 7"; break;
    case vk_numpad8: return "Numberpad 8"; break;
    case vk_numpad9: return "Numberpad 9"; break;
    
    case vk_left : return "Left" ; break;
    case vk_right: return "Right"; break;
    case vk_up   : return "Up"   ; break;
    case vk_down : return "Down" ; break;
}

return _chr;