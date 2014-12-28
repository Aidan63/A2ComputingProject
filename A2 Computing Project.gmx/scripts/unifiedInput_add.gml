///unifiedInput_add(control ID, action, keyboard, controller);

var control_ID       = argument[0];
var control_action   = argument[1];
var control_keyboard = argument[2];
var control_gamepad  = argument[3];

ds_grid_add(con_unifiedInput.input_keyboardGrid, control_ID, control_action, control_keyboard);
ds_grid_add(con_unifiedInput.input_gamepadGrid , control_ID, control_action, control_gamepad );