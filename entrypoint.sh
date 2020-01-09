#!/bin/bash

# what are we trying to install?
game_nm=garrysmod
game_id=4020

# install game to this directory
installdir=/home/steam/games/$game_nm

# if path does not exist, create it
mkdir -p $installdir

if [ -w $installdir ] # can we write into the directory?
then
	# Install or update the game in /home/steam/games/[game name]
	/opt/steamcmd/steamcmd.sh \
		+login anonymous \
		+force_install_dir $installdir \
		+app_update $game_id validate \
		+quit

	# ----------------------------------------------------------
	# GMOD SPECIFIC INSTALLATIONS
	# TODO: add mount cfg maybe?

else
	# install dir maybe mounted read-only, simply
	# skip installing/updating and inform the user.
	echo "Skipped game installation."
fi

cd $installdir/garrysmod/addons

# Install ULX
git clone https://github.com/TeamUlysses/ulx.git
git clone https://github.com/TeamUlysses/ulib.git

# run the next commands from the installdir
cd $installdir

# is the game launcher not executable?
if [ ! -x ./srcds_run ]
then
	# we cant run the game then.
	echo "game launcher not found, installed incorrectly?"
	exit 1
fi

# launch the game!
exec ./srcds_run \
	-game $game_nm \
	-console \
	$@ # append all remaining parameters
