FROM ubuntu:21.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install qemu-system-x86 xfce4 xfce4-goodies gnome-desktop xfce4-weather-plugin novnc neofetch
RUN useradd rafa

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/assets/configs/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
RUN neofetch
RUN ip a
