///unifiedInput_gamepad_get_down(control scheme);

var control_id = argument0;
var input_down = -1;
var inputs     = ds_list_create();

ds_list_add(inputs, gp_face1     );
ds_list_add(inputs, gp_face2     );
ds_list_add(inputs, gp_face3     );
ds_list_add(inputs, gp_face4     );
ds_list_add(inputs, gp_select    );
ds_list_add(inputs, gp_start     );
ds_list_add(inputs, gp_shoulderl );
ds_list_add(inputs, gp_shoulderr );
ds_list_add(inputs, gp_shoulderlb);
ds_list_add(inputs, gp_shoulderrb);
ds_list_add(inputs, gp_stickl    );
ds_list_add(inputs, gp_stickr    );

ds_list_add(inputs, gamepad_left_stick_up   );
ds_list_add(inputs, gamepad_left_stick_down );
ds_list_add(inputs, gamepad_left_stick_left );
ds_list_add(inputs, gamepad_left_stick_right);

ds_list_add(inputs, gamepad_right_stick_up   );
ds_list_add(inputs, gamepad_right_stick_down );
ds_list_add(inputs, gamepad_right_stick_left );
ds_list_add(inputs, gamepad_right_stick_right);

ds_list_add(inputs, gp_padd);
ds_list_add(inputs, gp_padu);
ds_list_add(inputs, gp_padl);
ds_list_add(inputs, gp_padr);
    
for (var i = 0; i < ds_list_size(inputs); i++)
{
    var input = ds_list_find_value(inputs, i);

    if (unifiedInput_isAnalog(input))
    {
        if (unifiedInput_analogSticks(control_id, input))
        {
            input_down = input
        }
    }
    else
    {
        if (gamepad_button_check(control_id - 1, input))
        {
            input_down = input;
        }
    }
}

ds_list_destroy(inputs);

return input_down;
