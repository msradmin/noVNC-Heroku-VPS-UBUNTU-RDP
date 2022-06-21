FROM ubuntu:21.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install supervisor geany leafpad zenity gnome-shell neofetch novnc qemu-utils wget qemu-system-x86 xfce4 -y
RUN dpkg --configure -a

ARG root_password="nootnoot"
ARG user_name="rafael"
ARG user_password="msroffice"
RUN echo root:$root_password | chpasswd && \
    apt-get update && apt-get install -y openssl sudo && \
    useradd -m -G sudo $user_name -p $(openssl passwd -1 $user_password) --shell /bin/bash
RUN neofetch

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/assets/configs/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]

