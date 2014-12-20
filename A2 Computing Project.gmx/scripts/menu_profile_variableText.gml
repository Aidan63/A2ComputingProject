///menu_profile_variableText();

if (menu_variableReal[menu_profilePlayer, 4] == 0)
{
    menu_variableText[menu_profilePlayer, 5 ] = unifiedInput_keyboard_keyName(ds_grid_get(con_unifiedInput.input_keyboardGrid, menu_profilePlayer, global.key_jump  ));
    menu_variableText[menu_profilePlayer, 6 ] = unifiedInput_keyboard_keyName(ds_grid_get(con_unifiedInput.input_keyboardGrid, menu_profilePlayer, global.key_left  ));
    menu_variableText[menu_profilePlayer, 7 ] = unifiedInput_keyboard_keyName(ds_grid_get(con_unifiedInput.input_keyboardGrid, menu_profilePlayer, global.key_right ));
    menu_variableText[menu_profilePlayer, 8 ] = unifiedInput_keyboard_keyName(ds_grid_get(con_unifiedInput.input_keyboardGrid, menu_profilePlayer, global.key_shoot ));
    menu_variableText[menu_profilePlayer, 9 ] = unifiedInput_keyboard_keyName(ds_grid_get(con_unifiedInput.input_keyboardGrid, menu_profilePlayer, global.key_pickup));
}
else
{
    menu_variableText[menu_profilePlayer, 5 ] = unifiedInput_gamepad_keyName(ds_grid_get(con_unifiedInput.input_gamepadGrid, menu_profilePlayer, global.key_jump  ));
    menu_variableText[menu_profilePlayer, 6 ] = unifiedInput_gamepad_keyName(ds_grid_get(con_unifiedInput.input_gamepadGrid, menu_profilePlayer, global.key_left  ));
    menu_variableText[menu_profilePlayer, 7 ] = unifiedInput_gamepad_keyName(ds_grid_get(con_unifiedInput.input_gamepadGrid, menu_profilePlayer, global.key_right ));
    menu_variableText[menu_profilePlayer, 8 ] = unifiedInput_gamepad_keyName(ds_grid_get(con_unifiedInput.input_gamepadGrid, menu_profilePlayer, global.key_shoot ));
    menu_variableText[menu_profilePlayer, 9 ] = unifiedInput_gamepad_keyName(ds_grid_get(con_unifiedInput.input_gamepadGrid, menu_profilePlayer, global.key_pickup));
}

for (var i = 1; i < 5; i ++)
{
    //Sprites
    switch (menu_variableReal[i, 2])
    {
        case 0:
            menu_variableText[i, 2] = "sprite 1";
        break;
        
        case 1:
            menu_variableText[i, 2] = "sprite 2";
        break;
        
        case 2:
            menu_variableText[i, 2] = "sprite 3";
        break;
    }
    
    //Voices
    switch (menu_variableReal[i, 3])
    {
        case 0:
            menu_variableText[i, 3] = "Male 1";
        break;
        
        case 1:
            menu_variableText[i, 3] = "Male 2";
        break;
        
        case 2:
            menu_variableText[i, 3] = "Female 1";
        break;
        
        case 3:
            menu_variableText[i, 3] = "Female 2";
        break;
        
        case 4:
            menu_variableText[i, 3] = "Robot 1";
        break;
        
        case 5:
            menu_variableText[i, 3] = "Robot 2";
        break;
    }
    
    //Control Method
    switch (menu_variableReal[i, 4])
    {
        case 0:
            menu_variableText[i, 4] = "Keyboard";
        break;
        
        case 1:
            menu_variableText[i, 4] = "Controller (xinput compatable)";
        break;
    }
}
