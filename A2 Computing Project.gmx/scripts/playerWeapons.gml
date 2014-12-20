
if (keyboard_check_pressed(ord("1")))
{
    plyr_currentWep = wep_mg;
}
if (keyboard_check_pressed(ord("2")))
{
    plyr_currentWep = wep_sg;
}
if (keyboard_check_pressed(ord("3")))
{
    plyr_currentWep = wep_rl;
}
if (keyboard_check_pressed(ord("4")))
{
    plyr_currentWep = wep_gl;
}
if (keyboard_check_pressed(ord("5")))
{
    plyr_currentWep = wep_pg;
}
if (keyboard_check_pressed(ord("6")))
{
    plyr_currentWep = wep_rg;
}

var baseDir = 0;
var xoffset = 0;
if (plyr_xscale == 1)
{
    baseDir = 0;
    xoffset = 42;
}
else
{
    baseDir = 180;
    xoffset = -42;
}

switch (plyr_currentWep)
{
    case wep_mg:
        if (unifiedInput_down(plyr_controlID, global.key_shoot))
        {
            if (plyr_canShoot == true)
            {
                if (weaponsSystem[plyr_currentWep, ammoNow] > 0)
                {
                    hitscan_x2[0] = 0;
                    hitscan_y2[0] = y + random_range(-10, 10);
                    
                    for (var i = 0; i < 193; i ++)
                    {
                        var target = collision_line(x, y, x + lengthdir_x(hitscan_x2[0], baseDir), hitscan_y2[0], par_entity, true, true)
                        if (target)
                        {
                            if (object_get_parent(target.object_index) == par_player)
                            {
                                if (target.plyr_teamID != plyr_teamID)
                                {
                                    target.plyr_health -= weaponsSystem[plyr_currentWep, damage];
                                    
                                    con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsHit] ++;
                                    
                                    if (target.plyr_health <= 0)
                                    {
                                        if (global.game_state == global.game_active)
                                        {
                                            con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_kills] ++;
                                            con_gameStats.globalStats_teamScore[plyr_teamID] ++;
                                        }
                                    }
                                    
                                    audio_play_sound(global.audio_effect_hit, 0, false);
                                    
                                    var i = irandom(3)
                                    if (i == 0)
                                    {
                                        audio_play_sound(target.audio_playerHit, 0, false);
                                    }
                                }
                            }
                            
                            break;
                        }
                        
                        hitscan_x2[0] += 10;
                    }
                    
                    hitscan_x1[0] = x;
                    hitscan_y1[0] = y;
                    
                    plyr_canShoot = false;
                    
                    weaponsSystem[plyr_currentWep, ammoNow] --;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                    
                    plyr_drawProjec = true;
                    
                    audio_play_sound(global.audio_effect_mg, 0, false);
                    
                    create_casing(obj_casing);
                    
                    con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsTotal] ++;
                }
                else
                {
                    audio_play_sound(global.audio_effect_noAmmo, 0, false);
                    
                    plyr_canShoot = false;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                }
            }
        }
    break;
    
    case wep_sg:
        if (unifiedInput_down(plyr_controlID, global.key_shoot))
        {
            if (plyr_canShoot == true)
            {
                if (weaponsSystem[plyr_currentWep, ammoNow] > 0)
                {
                    for (var i = 0; i < 11; i ++)
                    {
                        hitscan_x2[i] = 0;
                        hitscan_y2[i] = y + random_range(-45, 45);
                        
                        con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsTotal] ++;
                        
                        for (var j = 0; j < 193; j ++)
                        {
                            var target = collision_line(x, y, x + lengthdir_x(hitscan_x2[i], baseDir), hitscan_y2[i], par_entity, true, true)
                            if (target)
                            {
                                if (object_get_parent(target.object_index) == par_player)
                                {
                                    if (target.plyr_teamID != plyr_teamID)
                                    {
                                        target.plyr_health -= weaponsSystem[plyr_currentWep, damage];
                                        
                                        con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsHit] ++;
                                        
                                        if (target.plyr_health <= 0)
                                        {
                                            alarm[4] = 1;
                                        }
                                        
                                        var sound1 = global.audio_effect_hit;
                                        var sound2 = target.audio_playerHit;
                                        
                                        if (!audio_is_playing(sound1))
                                        {
                                            audio_play_sound(global.audio_effect_hit, 0, false);
                                        }
                                        if (!audio_is_playing(sound2))
                                        {
                                            audio_play_sound(target.audio_playerHit, 0, false);
                                        }
                                    }
                                }
                                
                                break;
                            }
                            
                            hitscan_x2[i] += 10;
                        }
                        
                        hitscan_x1[i] = x;
                        hitscan_y1[i] = y;
                    }
                    
                    plyr_canShoot = false;
                    
                    weaponsSystem[plyr_currentWep, ammoNow] --;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                    
                    plyr_drawProjec = true;
                    
                    audio_play_sound(global.audio_effect_sg, 0, false);
                    
                    repeat(2)
                    {
                        create_casing(obj_shell);
                    }
                }
                else
                {
                    audio_play_sound(global.audio_effect_noAmmo, 0, false);
                    
                    plyr_canShoot = false;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                }
            }
        }
    break;
    
    case wep_rl:
        if (unifiedInput_down(plyr_controlID, global.key_shoot))
        {
            if (plyr_canShoot == true)
            {
                if (weaponsSystem[plyr_currentWep, ammoNow] > 0)
                {
                    var grenade         = instance_create(x + xoffset, y + 4, obj_projectile_rocket);
                    grenade.direction   = baseDir;
                    grenade.speed       = 12;
                    grenade.image_angle = baseDir;
                    
                    grenade.bul_teamID = plyr_teamID;
                    grenade.bul_parent = id;
                    grenade.bul_plyrNo = plyr_controlID;
                    grenade.bul_damage = weaponsSystem[plyr_currentWep, damage];
                    grenade.bul_wepID  = "rl";
                    
                    plyr_canShoot = false;
                    
                    weaponsSystem[plyr_currentWep, ammoNow] --;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                    
                    audio_play_sound(global.audio_effect_rl, 0, false);
                    
                    con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsTotal] ++;
                }
                else
                {
                    audio_play_sound(global.audio_effect_noAmmo, 0, false);
                    
                    plyr_canShoot = false;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                }
            }
        }
    break;
    
    case wep_gl:
        if (unifiedInput_down(plyr_controlID, global.key_shoot))
        {
            if (plyr_canShoot == true)
            {
                if (weaponsSystem[plyr_currentWep, ammoNow] > 0)
                {
                    var grenade         = instance_create(x + xoffset, y + 4, obj_projectile_grenade);
                    grenade.direction   = baseDir + irandom_range(-4, 4);
                    grenade.speed       = 10;
                    grenade.image_angle = baseDir + irandom_range(-4, 4);
                    
                    grenade.bul_teamID = plyr_teamID;
                    grenade.bul_parent = id;
                    grenade.bul_plyrNo = plyr_controlID;
                    grenade.bul_damage = weaponsSystem[plyr_currentWep, damage];
                    grenade.bul_wepID  = "gl";
                    
                    plyr_canShoot = false;
                    
                    weaponsSystem[plyr_currentWep, ammoNow] --;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                    
                    audio_play_sound(global.audio_effect_gl, 0, false);
                    
                    con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsTotal] ++;
                }
                else
                {
                    audio_play_sound(global.audio_effect_noAmmo, 0, false);
                    
                    plyr_canShoot = false;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                }
            }
        }
    break;
    
    case wep_pg:
        if (unifiedInput_down(plyr_controlID, global.key_shoot))
        {
            if (plyr_canShoot == true)
            {
                if (weaponsSystem[plyr_currentWep, ammoNow] > 0)
                {
                    var bullet         = instance_create(x + xoffset, y + 4, obj_projectile_plasma);
                    bullet.direction   = baseDir + irandom_range(-2, 2);
                    bullet.speed       = 14;
                    bullet.image_angle = baseDir + irandom_range(-2, 2);
                    
                    bullet.bul_teamID = plyr_teamID;
                    bullet.bul_parent = id;
                    bullet.bul_plyrNo = plyr_controlID;
                    bullet.bul_damage = weaponsSystem[plyr_currentWep, damage];
                    bullet.bul_wepID  = "pg";
                    
                    plyr_canShoot = false;
                    
                    weaponsSystem[plyr_currentWep, ammoNow] --;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                    
                    audio_play_sound(global.audio_effect_pl, 0, false);
                    
                    con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsTotal] ++;
                }
                else
                {
                    audio_play_sound(global.audio_effect_noAmmo, 0, false);
                    
                    plyr_canShoot = false;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                }
            }
        }
    break;
    
    case wep_rg:
        if (unifiedInput_down(plyr_controlID, global.key_shoot))
        {
            if (plyr_canShoot == true)
            {
                if (weaponsSystem[plyr_currentWep, ammoNow] > 0)
                {
                    var laser_length = 1;
                    
                    for (var i = 0; i < 1921; i ++)
                    {
                        var target = collision_line(x + xoffset, y, x + lengthdir_x(laser_length, baseDir), y , par_entity, true, true);
                        if (target != noone)
                        {
                            if (object_get_parent(target.object_index) == par_player)
                            {
                                if (target.plyr_teamID != plyr_teamID)
                                {
                                    if (global.game_state == global.game_active)
                                    {
                                        con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_kills   ] ++;
                                        con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsHit] ++;
                                        con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_railsHit] ++;
                                        con_gameStats.globalStats_teamScore[plyr_teamID] ++;
                                    }
                                    
                                    with (target)
                                    {
                                        
                                        disintegrate(4, obj_particle, direction, 90, 2, 2, plyr_teamColour);
                                        instance_destroy();
                                    }
                                }
                            }
                            else
                            {
                                switch (target.object_index)
                                {
                                    case obj_projectile_rocket:
                                        with (target)
                                        {
                                            instance_destroy();
                                        }
                                    break;
                                    
                                    case obj_projectile_grenade:
                                        with (target)
                                        {
                                            instance_destroy();
                                        }
                                    break;
                                    
                                    case obj_projectile_plasma:
                                        with (target)
                                        {
                                            disintegrate(4, obj_particle, direction, 90, 2, 2, c_aqua);
                                            instance_destroy();
                                        }
                                    break;
                                }
                            }
                            
                            break;
                        }
                        else
                        {
                        }
                        
                        laser_length ++;
                    }
                    
                    railgunDraw = true;
                    
                    plyr_canShoot = false;
                    
                    weaponsSystem[plyr_currentWep, ammoNow] --;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                    alarm[1] = 5;
                    
                    audio_play_sound(global.audio_effect_rg, 0, false);
                    
                    con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_shotsTotal] ++;
                    con_gameStats.globalStats[plyr_controlID, con_gameStats.stat_railsTotal] ++;
                }
                else
                {
                    audio_play_sound(global.audio_effect_noAmmo, 0, false);
                    
                    plyr_canShoot = false;
                    alarm[0] = weaponsSystem[plyr_currentWep, coolDown];
                }
            }
        }
    break;
}

