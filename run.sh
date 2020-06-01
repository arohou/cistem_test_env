export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
DISPLAY_HOSTNAME="host.docker.internal"
export DISPLAY_NUMBER=$(ps -ef | grep "Xquartz :\d" | grep -v xinit | awk '{print $9;}')
xhost + 127.0.0.1
mkdir -p ${HOME}/.eclipse-docker-photon
docker run -ti --rm\
       -e DISPLAY=${DISPLAY_HOSTNAME}${DISPLAY_NUMBER} \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v ${HOME}:/mnt/ext_home/ \
	   -m 8GB \
	   --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
	   --name cistem_test_env \
       cistem_test_env
