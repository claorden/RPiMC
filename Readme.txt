# Sistema de descarga automática empleando rss y trakt.tv basado en http://www.raspberrypi.org/forums/viewtopic.php?f=35&t=47084

#Copiar imagen

#Dar permisos de escritura sobre usb y copiar estructura
chmod -R 777 /media/RPi\ HDD/Downloads 
chmod -R 777 /media/RPi\ HDD/TV\ Shows
chmod -R 777 /media/RPi\ HDD/Movies
chmod -R 777 /media/RPi\ HDD/Music

#Solucionar problemas de permisos de transmission sobre usb (por ntfs)
sudo nano /etc/init.d/transmission-daemon

USER=debian-transmission -> USER=pi

#Configurar opciones de transmission
sudo nano /etc/transmission-daemon/settings.json

#Editar configs.yml de Flexget y meter datos de acceso

#Añadir tareas en "cron" con root (no sé si es por usar usb ntfs, pero si no es en root da error de ¿python? ¿flexget?)
sudo crontab -e

#restart Transmission daemon at startup to solve auto-adding of torrents in watch-dir
@reboot /bin/sleep 120; /etc/init.d/transmission-daemon restart

#Execute flexget with TVShows config, every 3 hours, between 3:00 and 15:00
0 3,6,9,12,15 * * * /usr/local/bin/flexget -c "/media/RPi HDD/Downloads/flexget/configTVShows.yml" execute

#Execute flexget with Movies config, every day at midnight
0 0 * * * /usr/local/bin/flexget -c "/media/RPi HDD/Downloads/flexget/configMovies.yml" execute