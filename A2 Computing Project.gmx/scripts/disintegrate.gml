///disintegrate(division, dustobject, dustdir, dirvar, dustspeed, speedplus, colour);

var realx, realy, i, j, nnn, colour;
realx = x - sprite_get_xoffset(sprite_index);
realy = y - sprite_get_yoffset(sprite_index);
colour = argument6;

for (i = 0; i < sprite_width / argument0; i ++)
{
    for (j = 0; j < sprite_height / argument0; j ++)
    {
        if (collision_point(realx + i * argument0, realy + j * argument0, object_index, 1, false))
        {
            nnn = instance_create(realx + i * argument0, realy + j * argument0, argument1);
            nnn.spr = sprite_index;
            nnn.img = image_index;
            nnn.xx  = i * argument0;
            nnn.yy  = j * argument0;
            nnn.wid = argument0;
            nnn.hei = argument0;
            nnn.direction = argument2 + argument3 - random(argument3 * 2);
            nnn.speed     = argument4 + random(argument5);
            nnn.colour    = colour;
        }
    }
}