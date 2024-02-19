FROM ubuntu:latest

WORKDIR /app

ENV HOST_USER=nova

RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y openssh-client && \
    apt-get install -y tightvncserver tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer && \
    apt-get clean

RUN touch ~/.Xauthority

RUN mkdir -p ~/.vnc && \
    echo "password" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

ADD startup.sh ./
RUN chmod u+x startup.sh

EXPOSE 5901

ENTRYPOINT [ "./startup.sh" ]
