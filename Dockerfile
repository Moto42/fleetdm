FROM  fleetdm/fleet:v4.55.1
ADD fleetdmStart.sh /init.sh
CMD fleet serve || fleet prepare db && fleet serve;