///load_level(file name);

var x1 = 0;
var y1 = 1;
var x2 = 2;
var y2 = 3;

file = file_text_open_read(working_directory + argument[0]);

//Read weapon spawn position
for (var i = 0; i < 5; i ++)
{
    map_weaponSpawn[i, x1] = file_text_read_real(file);
    file_text_readln(file);
    map_weaponSpawn[i, y1] = file_text_read_real(file);
    file_text_readln(file);
}

//Read flag spawn position
file_text_readln(file);
map_flagSpawn[x1] = file_text_read_real(file);
file_text_readln(file);
map_flagSpawn[y1] = file_text_read_real(file);
file_text_readln(file);

//Read player spawn positions
file_text_readln(file);

for (var i = 0; i < 4; i ++)
{
    map_playerSpawn[i, x1] = file_text_read_real(file);
    file_text_readln(file);
    map_playerSpawn[i, y1] = file_text_read_real(file);
    file_text_readln(file);
}

//Read spawn boundry boxes
for (var i = 0; i < 4; i ++)
{
    file_text_readln(file);
    
    map_spawnBoundry[i, x1] = file_text_read_real(file);
    file_text_readln(file);
    map_spawnBoundry[i, y1] = file_text_read_real(file);
    file_text_readln(file);
    map_spawnBoundry[i, x2] = file_text_read_real(file);
    file_text_readln(file);
    map_spawnBoundry[i, y2] = file_text_read_real(file);
    file_text_readln(file);
}

file_text_close(file);

//Load player names into an array
for (var i = 1; i < 5; i ++)
{
    var file_name = "player" + string(i) + ".ini";
    show_debug_message(file_name);
    
    ini_open(working_directory + file_name);
    
    player_name[i] = ini_read_string("player-settings", "name", "player " + string(i));
    
    player_sprite[i] = ini_read_real("player-settings", "sprite", 0);
    player_voice [i] = ini_read_real("player-settings", "voice" , 0);
    
    ini_close();
}