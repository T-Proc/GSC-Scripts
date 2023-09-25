
init()
{
	level.clientid = 0;
	level thread onplayerconnect();
	player thread onplayerspawned();
}

onplayerconnect()
{
	for ( ;; )
	{
		level waittill( "connecting", player );
		player.clientid = level.clientid;
		level.clientid++;
		player thread onplayerspawned();
	}
}

onplayerspawned()
{
	level endon( "game_ended" );
    self endon( "disconnect" );
	
	for(;;)
	{
		self waittill( "spawned_player" );
		self IPrintLnBold( "^6DISCORD: ^7tproc.net/discord" );
	}
}