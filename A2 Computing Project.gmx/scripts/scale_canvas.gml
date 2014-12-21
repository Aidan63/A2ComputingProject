///scale_canvas();

//argument0 = base width;
//argument1 = base height;
//argument2 = current width
//argument3 = current height
//argument4 = center window (true, false);

var aspect = argument0 / argument1;

if (argument2 / aspect > argument3)
{
    window_set_size(argument3 * aspect, argument3);
}
else
{
    window_set_size(argument2, argument2 / aspect);
}

if (argument4 == true)
{
    window_center();
}

