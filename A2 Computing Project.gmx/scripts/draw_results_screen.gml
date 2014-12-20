
//--------------- Draw Player Team Points---------------//

draw_set_colour(c_black);
draw_set_halign(0);
draw_set_valign(1);

//Title
var winningTeam_string = "";

switch (winning_team)
{
    case 1: winningTeam_string = "Blue"  ; break;
    case 2: winningTeam_string = "Red"   ; break;
    case 3: winningTeam_string = "Green" ; break;
    case 4: winningTeam_string = "Yellow"; break;
}

draw_set_font(fnt_roboto_35);
draw_text(576, 128, winningTeam_string + " Team Wins");

//Team names
draw_set_font(fnt_roboto_25);
draw_text(576, 208 + (0 * 64), "Blue"  );
draw_text(576, 208 + (1 * 64), "Red"   );
draw_text(576, 208 + (2 * 64), "Green" );
draw_text(576, 208 + (3 * 64), "Yellow");

//Team Scores
for (var i = 1; i < 5; i ++)
{
    draw_text(928, 144 + (i * 64), con_gameStats.globalStats_teamScore[i]);
}

//---------------Draw Specific Player Stats---------------//

draw_set_halign(0);
draw_set_valign(1);

//Title

draw_set_font(fnt_roboto_35);
draw_text(576, 480, "Player Stats");

draw_set_font(fnt_roboto_25);
draw_set_halign(1);
draw_set_valign(1);

draw_text(928 + (0 * 96), 560, "K" );
draw_text(928 + (1 * 96), 560, "D" );
draw_text(928 + (2 * 96), 560, "P" );
draw_text(928 + (3 * 96), 560, "TA");
draw_text(928 + (4 * 96), 560, "RA");

for (var i = 1; i < 5; i ++)
{
    //Calculate Player Accuracies
    if (con_gameStats.globalStats[i, con_gameStats.stat_shotsTotal] != 0)
    {
        con_gameStats.globalStats[i, con_gameStats.stat_shotAcc] = round((con_gameStats.globalStats[i, con_gameStats.stat_shotsHit] / con_gameStats.globalStats[i, con_gameStats.stat_shotsTotal]) * 100);
    }
    else
    {
        con_gameStats.globalStats[i, con_gameStats.stat_shotsTotal] = 0;
    }
    if (con_gameStats.globalStats[i, con_gameStats.stat_railsTotal] != 0)
    {
        con_gameStats.globalStats[i, con_gameStats.stat_railAcc] = round((con_gameStats.globalStats[i, con_gameStats.stat_railsHit] / con_gameStats.globalStats[i, con_gameStats.stat_railsTotal]) * 100);
    }
    else
    {
        con_gameStats.globalStats[i, con_gameStats.stat_railsTotal] = 0;
    }
    
    //Draw player names
    draw_set_halign(0);
    draw_set_valign(1);
    draw_text(576, 560 + (i * 64), string(con_game.player_name[i]));

    //Draw stats for each player
    draw_set_halign(1);
    draw_set_valign(1);
    draw_text(928 , 560 + (i * 64), con_gameStats.globalStats[i, con_gameStats.stat_kills ]);
    draw_text(1024, 560 + (i * 64), con_gameStats.globalStats[i, con_gameStats.stat_deaths]);
    draw_text(1120, 560 + (i * 64), con_gameStats.globalStats[i, con_gameStats.stat_gamePoints]);
    draw_text(1216, 560 + (i * 64), con_gameStats.globalStats[i, con_gameStats.stat_shotAcc]);
    draw_text(1312, 560 + (i * 64), con_gameStats.globalStats[i, con_gameStats.stat_railAcc]);
}

//---------------Draw Other Stuff---------------//

draw_set_halign(0);
draw_set_valign(1);
draw_set_font(fnt_roboto_15);

draw_text(576, 896, "Press Shoot to Return to the Menus or Pickup to Restart");

draw_set_alpha(1);