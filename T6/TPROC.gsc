#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_utility;

init()
{
    // Give your player the Packed M1911 aka Mustang and Sally
    level thread onPlayerConnect();
    thread remove_perk_limit();
}
//Remove Perk Limit
remove_perk_limit()
{
    level waittill( "start_of_round" );
    level.perk_purchase_limit = 9;
    self maps/mp/zombies/_zm_perks::give_perk("specialty_deadshot");
    
}

onPlayerConnect()
{
    for(;;) {
        level waittill ("connecting", player);
        player thread onplayerspawned();
        player thread tprocDiscord();
    }
}

onplayerspawned()
{
    self endon("disconnect");
	level endon("end_game");

    for (;;) {
        self waittill("spawned_player");
    }
}
//Share the discord
tprocDiscord()
{
	self endon("disconnect");
	self.discordText = createFontString("default" , 1.0);
    self.discordText setPoint("CENTER", "TOP", -370, "CENTER");
    while(true) {
        self.discordText setText( "^6DISCORD: ^7tproc.net/discord");
        wait 0.5;
    }
}
