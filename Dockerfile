FROM ubuntu:latest

WORKDIR /app

ENV HOST_USER=nova
ENV VNC_USER=nova

RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y xfonts-base && \
    apt-get install -y xfce4 xfce4-goodies && \
    apt-get install -y tightvncserver && \
    apt-get clean

RUN touch ~/.Xauthority

ADD xstartup ~/.vnc

RUN mkdir -p ~/.vnc && \
    echo "password" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

ADD startup.sh ./
RUN chmod u+x startup.sh

EXPOSE 5901

ENTRYPOINT [ "./startup.sh" ]
