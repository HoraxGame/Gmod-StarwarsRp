FROM zombi/steam
MAINTAINER MadMaurice <madmaurice@zom.bi>, Paul <paul@zom.bi>
EXPOSE 27015/udp

ADD bin/entrypoint.sh /entrypoint.sh
RUN chmod +xr /entrypoint.sh
USER steam

ENTRYPOINT ["/entrypoint.sh"]
CMD ["+maxplayers", "16", "+hostname", "Zom.bi TTT", "+gamemode", "terrortown", "+map", "gm_construct"]
