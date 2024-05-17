Enter the docker file contents into your Dockerfile and in the sam directory do this:`git clone https://github.com/lyc8503/UptimeFlare data/`

Afterwards build the script with this `docker build -t uptimeflare:latest .` and run it with this: `docker run --name test --rm -p 9999:9999 uptimeflare:latest`

The Webinterface SHOULD be here: `localhost:9999`

If you update the Dockerfile you need to rebuild the image

To clean up all unused images and volumes do this:
`docker container prune -f && docker image prune -f && docker network prune -f && docker volume prune -f`

# ! WIP !
