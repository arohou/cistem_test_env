# Start from Ubuntu 18.04
FROM ubuntu:18.04

RUN apt-get update &&\
	apt-get install -y sudo xterm  libgtk2.0-0 libfftw3-single3 xdotool imagemagick x11-apps &&\
	mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

# Define the user
USER developer
ENV HOME /home/developer

# We begin at the host's home, which will be mounted by the docker run command
WORKDIR /mnt/ext_home

# Launch xterm
CMD xterm