///menu_setup_variableText();

for (var i = 0; i < 4; i ++)
{
    switch (menu_variableReal[i])
    {
        case 1:
            menu_variableText[i] = "Blue";
        break;
        
        case 2:
            menu_variableText[i] = "Red";
        break;
        
        case 3:
            menu_variableText[i] = "Green";
        break;
        
        case 4:
            menu_variableText[i] = "Yellow";
        break;
        
        case 5:
            menu_variableText[i] = "Not In Game";
        break;
    }
}

switch (menu_variableReal[4])
{
    case 0:
        menu_variableText[4] = "Deathmatch";
    break;
    
    case 1:
        menu_variableText[4] = "1 Flag CTF";
    break;
    
    case 2:
        menu_variableText[4] = "InstaJib";
    break;
    
    case 3:
        menu_variableText[4] = "Oddball";
    break;
}

menu_variableText[5] = menu_variableReal[5];

menu_variableText[6] = "Arena " + string(menu_variableReal[6] + 1);