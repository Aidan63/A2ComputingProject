
var obj = argument0;

if (plyr_xscale == 1)
{
    var casing = instance_create(x + 24, y, obj);
    
    with (casing)
    {
        motion_set(random_range(90, 180), 6);
    }
}
else
{
    var casing = instance_create(x - 24, y, obj);
    
    with (casing)
    {
        motion_set(random_range(90, 0), 6);
    }
}