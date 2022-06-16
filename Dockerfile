FROM ubuntu:21.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 ufw sudo neofetch bash net-tools qemu-utils qemu-system-x86 novnc x11vnc xvfb xfce4-goodies supervisor xfce4 xfce4-goodies gnome-shell ubuntu-gnome-desktop gnome-session gdm3 tasksel ssh terminator git nano curl wget zip unzip python3 python3-pip python-is-python3 iputils-ping docker.io falkon
RUN apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y
RUN apt-get install virt-manager -y
RUN dpkg --configure -a
COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/assets/configs/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
RUN neofetch
