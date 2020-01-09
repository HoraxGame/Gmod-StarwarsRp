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
