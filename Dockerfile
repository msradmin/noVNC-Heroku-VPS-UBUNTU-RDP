FROM ubuntu:21.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 ufw sudo neofetch bash net-tools tigervnc-common xrdp tigervnc-standalone-server novnc x11vnc xvfb xfce4-goodies supervisor xfce4 gnome-shell ubuntu-gnome-desktop gnome-session gdm3 tasksel ssh terminator git nano curl wget zip unzip python3 python3-pip python-is-python3 iputils-ping docker.io falkon
RUN sudo systemctl status xrdp
RUN sudo usermod -a -G ssl-cert xrdp
RUN sudo systemctl restart xrdp
RUN sudo ufw allow from 192.168.1.0/24 to any port 3389
RUN sudo ufw reload
RUN useradd msrzitos

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/assets/configs/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
