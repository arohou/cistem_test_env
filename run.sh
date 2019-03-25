export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
#defaults write org.x.X11 enable_test_extensions -boolean true
#defaults write org.macosforge.xquartz.X11 enable_test_extensions -boolean true
#open -a XQuartz
xhost + $IP
mkdir -p ${HOME}/.eclipse-docker-photon
docker run -ti --rm \
       -e DISPLAY=$IP:0 \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v ${HOME}:/mnt/ext_home/ \
	   -v ${HOME}/.eclipse-docker-photon:/home/developer \
	   -m 8GB \
	   --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
	   --name cistem_dev_env \
       cistem_test_env
