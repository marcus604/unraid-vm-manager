# unraid-vm-manager
Allows VM's to be created programatically 


# Manually Build

1. `docker build -t vm-manager .`
2. Add your server IP and desired web ui port to .env
3. `docker-compose up`
4. Exec into pod `docker exec -it <image_name> /bin/sh`


# TODO

1. Edit create image and create vm scripts to be more variable friendly
2. Copy over create image and create vm scripts
3. Confirm VNC is working

