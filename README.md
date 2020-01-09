## steam-gmod
steam-gmod is the base image for an "Gary's Mod" server, combined with a CounterStrike:Source server for assets.

### Data locations
 * maps in /home/steam/gmod/garrysmod/maps
 * server configuration in /home/steam/gmod/garrysmod/cfg/server.cfg
 * bans in /home/steam/gmod/garrysmod/cfg/banned_user.cfg
 * motd in /home/steam/gmod/garrysmod/addons/ulx/ulx_motd.txt
 * addon data in /home/steam/gmod/garrysmod/data/

Data for optional mods
 * ttt_damagelogs data in /home/steam/gmod/garrysmod/addons/ttt_damagelogs
 * damage logs database in /home/steam/gmod/garrysmod/sv.db

### Building steam-gmod

```
docker build -t zombi/steam-gmod .
```

### Running steam-gmod

Please note that you probably want to add a workshop collection, which
can be generated in steam. It is a good idea to put mods like Wiremod,
Ulib, ULX etc. there, and extend with some maps and custom props.

```
docker run -d \
 --name gmod-1 \
 -p 27015:27015/udp \
 -p 27015:27015 \
 -v /data/steam-games/:/home/steam/games/ \
 -v /data/gmod/maps/:/home/steam/games/garrysmod/garrysmod/maps/ \
 -v /data/gmod/server.cfg:/home/steam/games/garrysmod/garrysmod/cfg/server.cfg \
 -v /data/gmod/motd.txt:/home/steam/games/garrysmod/garrysmod/addons/ulx/ulx_motd.txt \
 -v /data/gmod/bans.cfg:/home/steam/games/garrysmod/garrysmod/cfg/banned_user.cfg \
 -v /data/gmod/addons/tttdamagelogs:/home/steam/games/garrysmod/garrysmod/addons/tttdamagelogs/ \
 -v /data/gmod/data/:/home/steam/gmod/garrysmod/data/ \
 zombi/steam-gmod +hostname "Zom.bi TTT" \
 -authkey SUPERLONGAUTHKEYAAAAAAAAA23880ED \
 +host_workshop_collection 337948370 \
 +gamemode terrortown \
 +maxplayers 16 \
 +map ttt_dolls
```

to start up a simple server to terrorize some terrorists.

If you want to start up a Sandbox, you can do that too:

```
docker run -d \
 --name gmod-1 \
 -p 27015:27015/udp \
 -p 27015:27015 \
 -v /data/steam-games/:/home/steam/games/ \
 -v /data/gmod/server.cfg:/home/steam/games/garrysmod/garrysmod/cfg/server.cfg \
 -v /data/gmod/motd.txt:/home/steam/games/garrysmod/garrysmod/addons/ulx/ulx_motd.txt \
 -v /data/gmod/bans.cfg:/home/steam/games/garrysmod/garrysmod/cfg/banned_user.cfg \
 -v /data/gmod/data/:/home/steam/games/garrysmod/garrysmod/data/ \
 zombi/steam-gmod +hostname "Zom.bi Sandbox" \
 +host_workshop_collection 337948370 \
 +gamemode sandbox \
 +maxplayers 16 \
 +map gm_construct
```

### Data locations
 * game data in /home/steam/games
 * maps in /home/steam/games/garrysmod/garrysmod/maps
 * server configuration in /home/steam/games/garrysmod/garrysmod/cfg/server.cfg
 * bans in /home/steam/games/garrysmod/garrysmod/cfg/banned_user.cfg
 * motd in /home/steam/games/garrysmod/garrysmod/addons/ulx/ulx_motd.txt
 * addon data in /home/steam/games/garrysmod/garrysmod/data/

Data for optional mods
 * ttt_damagelogs data in /home/steam/gmod/garrysmod/addons/ttt_damagelogs

protip: you can simplify deployment by using named volumes.
